# == Schema Information
#
# Table name: preferences
#
#  id                        :bigint           not null, primary key
#  last_mdx_meteotest_update :datetime
#  request_timeout           :integer          default(15)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class PreferenceSerializer < ActiveModel::Serializer
  attributes :request_timeout, :last_mdx_meteotest_update
  attribute :languages do
    object.languages.pluck :locale
  end
end
