# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  contact    :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord
  extend Mobility
  translates :title, type: :string

  validates :title, presence: true
  validates :contact, presence: true

end
