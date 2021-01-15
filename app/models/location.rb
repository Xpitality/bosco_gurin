# == Schema Information
#
# Table name: locations
#
#  id                  :bigint           not null, primary key
#  elevation           :integer
#  lat                 :string(255)
#  lng                 :string(255)
#  name                :string(255)
#  open_weather_report :text(65535)
#  open_weather_time   :datetime
#  weather_forecast    :boolean
#  webcam              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'open_weather'
class Location < ApplicationRecord

  OPEN_WEATHER_REFRESH_MINUTES = Rails.env.staging? ? 6 : 60

  validates_uniqueness_of :weather_forecast, message: 'can be enabled for only one location', if: :weather_forecast

  store :open_weather_report

  validates :name, presence: true
  validates :lat, presence: true, format: { with: /\d+\.\d+/, message: 'has incorrect format' }
  validates :lng, presence: true, format: { with: /\d+\.\d+/, message: 'has incorrect format' }
  validates :elevation, presence: true, format: { with: /\d+/, message: 'has incorrect format' }

  def weather_refresh_needed?
    open_weather_time.nil? || OPEN_WEATHER_REFRESH_MINUTES.minute.ago > open_weather_time || updated_at > open_weather_time
  end

  def weather_refresh
    if self.weather_refresh_needed? && !self.lat.nil? && !self.lng.nil? && !ENV['OPENWEATHER_KEY'].nil?

      locales = %w(en it de fr) & Preference.first.languages.pluck(:locale)


      if self.weather_forecast
        current_description = {}
        daily_description = [{}, {}, {}, {}, {}, {}, {}, {}]

        locales.each do |locale|
          report = OpenWeather.new.one_call(self.lat, self.lng, locale)
          current_description[locale] = report["current"]["weather"].first["description"]

          report["daily"].each_with_index do |daily_report, i|
            daily_description[i][locale] = daily_report["weather"].first["description"]
          end

          self.open_weather_report = report if locale == 'en'
        end

        current_weather = self.open_weather_report["current"]["weather"].first
        current_weather["description_i18n"] = current_description
        self.open_weather_report["current"]["weather"] = [current_weather]

        daily_weather = self.open_weather_report["daily"]
        daily_description.each_with_index do |description, i|
          daily_weather[i]["weather"].first["description_i18n"] = description
        end
        self.open_weather_report["daily"] = daily_weather

      else
        description = {}
        locales.each do |locale|
          report = OpenWeather.new.one_call(self.lat, self.lng, locale, true)
          description[locale] = report["weather"].first["description"]
          self.open_weather_report = report if locale == 'en'
        end
        weather = self.open_weather_report["weather"].first
        weather["description_i18n"] = description
        self.open_weather_report["weather"] = [weather]
      end


      self.open_weather_time = Time.now
      self.record_timestamps = false
      self.save
    end
  end
end
