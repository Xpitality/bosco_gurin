# == Schema Information
#
# Table name: preferences
#
#  id              :bigint           not null, primary key
#  request_timeout :integer          default(15)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Preference < ApplicationRecord
  validates :request_timeout, presence: true
  has_many :languages
end
