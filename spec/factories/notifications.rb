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
FactoryBot.define do
  factory :notification do
    text_en { Faker::Lorem.paragraph }
    text_it { Faker::Lorem.paragraph }
    text_de { Faker::Lorem.paragraph }
    text_fr { Faker::Lorem.paragraph }
    visible_in_app { [true, false].sample }
  end
end
