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
class ContactSerializer < BaseSerializer
  attributes :contact

  attribute :title do
    Hash[I18n.available_locales.map{|l| [l, object.send("title_#{l}".to_sym)] }]
  end
end
