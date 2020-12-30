# == Schema Information
#
# Table name: events
#
#  id                 :bigint           not null, primary key
#  date_from          :date
#  date_to            :date
#  expiry_date        :date
#  image_content_type :string(255)
#  image_file_name    :string(255)
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  text               :text(65535)
#  title              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class EventSerializer < BaseSerializer
  attribute :date_from do
    object.date_from.in_time_zone('Rome').strftime("%Y-%m-%d") if object.date_from
  end

  attribute :date_to do
    object.date_to.in_time_zone('Rome').strftime("%Y-%m-%d") if object.date_to
  end

  attribute :expiry_date do
    object.expiry_date.in_time_zone('Rome').strftime("%Y-%m-%d") if object.expiry_date
  end

  attribute :title do
    Hash[I18n.available_locales.map{|l| [l, object.send("title_#{l}".to_sym)] }]
  end

  attribute :text do
    Hash[I18n.available_locales.map{|l| [l, object.send("text_#{l}".to_sym)] }]
  end

  attribute :image do
    Hash[%w(medium thumb).map{|style| [style, object.image.url(style.to_sym)]}]
  end
end
