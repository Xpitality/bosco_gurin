# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  pushed_at      :datetime
#  text           :text(65535)
#  visible_in_app :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Notification < ApplicationRecord
  extend Mobility
  translates :text, type: :text

  validates_uniqueness_of :visible_in_app, message:'can be enabled for only one notification', if: :visible_in_app

  def self.visible_in_app
    where(visible_in_app: true)
  end

  validates :text, presence: true
end
