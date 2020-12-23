FactoryBot.define do
  factory :contact do
    title_en { Faker::Lorem.sentence }
    title_it { Faker::Lorem.sentence }
    title_de { Faker::Lorem.sentence }
    title_fr { Faker::Lorem.sentence }
    contact { Faker::PhoneNumber.cell_phone }
  end
end
