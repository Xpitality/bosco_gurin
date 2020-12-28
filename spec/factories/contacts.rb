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
FactoryBot.define do
  factory :contact do
    title_en { Faker::Lorem.sentence }
    title_it { Faker::Lorem.sentence }
    title_de { Faker::Lorem.sentence }
    title_fr { Faker::Lorem.sentence }
    contact { Faker::PhoneNumber.cell_phone }
  end
end
