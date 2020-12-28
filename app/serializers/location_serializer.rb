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
class LocationSerializer < BaseSerializer
  attributes :elevation, :lat, :lng, :name, :webcam, :open_weather_time, :show_weather

  attribute :open_weather_report do
    if object.show_weather
      object.open_weather_report
    else
      {}
    end
  end

end
