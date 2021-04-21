# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  pushed_at      :datetime
#  text           :text(65535)
#  title          :text(65535)
#  visible_in_app :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Notification < ApplicationRecord
  extend Mobility
  translates :text, type: :text
  translates :title, type: :string

  validates_uniqueness_of :visible_in_app, message:'can be enabled for only one notification', if: :visible_in_app
  validate  :text_and_title_presence

  def self.visible_in_app
    where(visible_in_app: true)
  end

  private

  def text_and_title_presence
    errors.add(:text, 'Text has to be added for all languages') if I18n.available_locales.any?{|l| self.send("text_#{l}".to_sym).blank? }
    errors.add(:title, 'Title has to be added for all languages') if I18n.available_locales.any?{|l| self.send("title_#{l}".to_sym).blank? }
  end
end
