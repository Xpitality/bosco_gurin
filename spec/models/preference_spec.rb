# == Schema Information
#
# Table name: preferences
#
#  id              :bigint           not null, primary key
#  request_timeout :integer          default(15)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Preference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
