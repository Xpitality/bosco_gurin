# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  elevation  :integer
#  lat        :string(255)
#  lng        :string(255)
#  name       :string(255)
#  webcam     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
end
