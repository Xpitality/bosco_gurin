# == Schema Information
#
# Table name: locations
#
#  id                           :bigint           not null, primary key
#  elevation                    :integer
#  lat                          :string(255)
#  lng                          :string(255)
#  mdx_meteotest_key            :string(255)
#  mdx_meteotest_meteo_days     :text(65535)
#  mdx_meteotest_meteo_standard :text(65535)
#  name                         :string(255)
#  open_weather_report          :text(65535)
#  open_weather_time            :datetime
#  weather_forecast             :boolean
#  webcam                       :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
class LocationSerializer < BaseSerializer
  attributes :elevation, :lat, :lng, :name, :webcam, :open_weather_time, :weather_forecast, :open_weather_report, :mdx_meteotest_meteo_days, :mdx_meteotest_meteo_standard
end
