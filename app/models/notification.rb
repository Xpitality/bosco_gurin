# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  pushed     :boolean          default(FALSE)
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
  extend Mobility
  translates :text, type: :text

  def self.pushed
    where(pushed: true)
  end

  validates :text, presence: true

end
