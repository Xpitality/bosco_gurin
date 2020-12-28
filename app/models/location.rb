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
#  show_weather        :boolean
#  webcam              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'open_weather'
class Location < ApplicationRecord

  OPEN_WEATHER_REFRESH_MINUTES = 60

  validates_uniqueness_of :show_weather, message:'can be enabled for only one location', if: :show_weather

  store :open_weather_report


  validates :name, presence: true
  validates :lat, presence: true, format: { with: /\d+\.\d+/, message: 'has incorrect format' }
  validates :lng, presence: true, format: { with: /\d+\.\d+/, message: 'has incorrect format' }
  validates :elevation, presence: true, format: { with: /\d+/, message: 'has incorrect format' }

  def weather_refresh_needed?
    self.show_weather? && (open_weather_time.nil? || open_weather_time > OPEN_WEATHER_REFRESH_MINUTES.minute.ago)
  end

  def weather_refresh
    if self.weather_refresh_needed? && !self.lat.nil? && !self.lng.nil? && ENV['OPENWEATHER_KEY']
      self.open_weather_report = OpenWeather.new.one_call(self.lat, self.lng)
      if self.open_weather_report[:cod] == 200
        self.open_weather_time = Time.now
        self.save
      end
    end
  end
end
