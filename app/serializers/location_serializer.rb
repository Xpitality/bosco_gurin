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
class LocationSerializer < BaseSerializer
  attributes :elevation, :lat, :lng, :name, :webcam, :open_weather_time, :open_weather_report
  #
  # attribute :created_at do
  #   object.created_at.in_time_zone('Rome').strftime("%Y-%m-%d")
  # end
end
