# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  link       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Link < ApplicationRecord
  extend Mobility
  translates :title, type: :string

  validates :title, presence: true
  validates :link, presence: true

end
