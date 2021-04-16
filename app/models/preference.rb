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

require 'mdx_meteotest'
class Preference < ApplicationRecord
  VALID_LOCALES = [:it, :en, :de, :fr]

  MDX_METEOTEST_REFRESH_MINUTES = 59

  validates :request_timeout, presence: true
  has_many :languages

  class << self
    def last_mdx_meteotest_update
      Preference.first.last_mdx_meteotest_update
    end

    def last_mdx_meteotest_update!
      Preference.first.update_attribute :last_mdx_meteotest_update, Time.now
    end

    def mdx_meteotest_refresh_needed?
      incomplete_location_report = Location.all.any?{|l| l.missing_mdx_meteo }
      preference = Preference.first
      incomplete_location_report || preference.last_mdx_meteotest_update.nil? || MDX_METEOTEST_REFRESH_MINUTES.minute.ago > preference.last_mdx_meteotest_update
    end
  end
end
