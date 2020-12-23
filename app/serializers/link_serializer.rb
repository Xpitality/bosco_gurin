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
class LinkSerializer < BaseSerializer
  attributes :link

  attribute :title do
    Hash[I18n.available_locales.map{|l| [l, object.send("title_#{l}".to_sym)] }]
  end
end
