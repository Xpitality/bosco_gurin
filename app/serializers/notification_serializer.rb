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