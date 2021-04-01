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
FactoryBot.define do
  factory :location do
    elevation {Faker::Number.between(from: 1500, to: 3000)}
    lat { '9.94' }
    lng { '76.26' }
    name { Faker::Mountain.name }
    weather_forecast { !Location.where(weather_forecast: true).exists? }
  end
end
