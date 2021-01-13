# == Schema Information
#
# Table name: preferences
#
#  id              :bigint           not null, primary key
#  request_timeout :integer          default(15)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class PreferenceSerializer < ActiveModel::Serializer
  attributes :request_timeout
end
