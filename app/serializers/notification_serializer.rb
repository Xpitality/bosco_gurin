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
class NotificationSerializer < BaseSerializer
  attribute :text do
    Hash[I18n.available_locales.map{|l| [l, object.send("text_#{l}".to_sym)] }]
  end

  attribute :created_at do
    object.created_at.in_time_zone('Rome').strftime("%Y-%m-%d")
  end

  attribute :updated_at do
    object.updated_at.in_time_zone('Rome').strftime("%Y-%m-%d")
  end
end
