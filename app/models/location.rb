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
#  webcam              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'open_weather'
class Location < ApplicationRecord

  store :open_weather_report

  def weather_refresh_needed?
    open_weather_time.nil? || open_weather_time > 2.minute.ago
  end

  def weather_refresh
    if self.weather_refresh_needed? && !self.lat.nil? && !self.lng.nil? && ENV['OPENWEATHER_KEY']
      options = { units: "metric", APPID: ENV['OPENWEATHER_KEY'] }
      self.open_weather_report = OpenWeather::Current.geocode(self.lat, self.lng , options)
      if self.open_weather_report[:cod] == 200
        self.open_weather_time = Time.now
        self.save
      end
    end
  end
end
