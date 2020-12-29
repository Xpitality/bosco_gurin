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

  OPEN_WEATHER_REFRESH_MINUTES = 6

  validates_uniqueness_of :weather_forecast, message:'can be enabled for only one location', if: :weather_forecast

  store :open_weather_report


  validates :name, presence: true
  validates :lat, presence: true, format: { with: /\d+\.\d+/, message: 'has incorrect format' }
  validates :lng, presence: true, format: { with: /-?\d+\.\d+/, message: 'has incorrect format' }
  validates :elevation, presence: true, format: { with: /\d+/, message: 'has incorrect format' }

  def weather_refresh_needed?
    open_weather_time.nil? || open_weather_time > OPEN_WEATHER_REFRESH_MINUTES.minute.ago || updated_at > open_weather_time
  end

  def weather_refresh
    if self.weather_refresh_needed? && !self.lat.nil? && !self.lng.nil? && ENV['OPENWEATHER_KEY']
      if self.weather_forecast
        self.open_weather_report = OpenWeather.new.one_call(self.lat, self.lng)
      else
        self.open_weather_report = OpenWeather.new.one_call(self.lat, self.lng, true)
      end
      self.open_weather_time = Time.now
      self.record_timestamps = false
      self.save(validate: false)
    end
  end
end
