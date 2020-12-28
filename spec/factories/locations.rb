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
FactoryBot.define do
  factory :location do
    elevation {Faker::Number.between(from: 1500, to: 3000)}
    lat { '9.94' }
    lng { '76.26' }
    name { Faker::Mountain.name }
    show_weather { !Location.where(show_weather: true).exists? }
  end
end
