# == Schema Information
#
# Table name: languages
#
#  id            :bigint           not null, primary key
#  locale        :string(255)
#  name          :string(255)
#  preference_id :bigint
#
# Indexes
#
#  index_languages_on_preference_id  (preference_id)
#
class Language < ApplicationRecord
  belongs_to :preference
end
