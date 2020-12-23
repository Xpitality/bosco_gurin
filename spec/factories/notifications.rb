FactoryBot.define do
  factory :notification do
    text_en { Faker::Lorem.paragraph }
    text_it { Faker::Lorem.paragraph }
    text_de { Faker::Lorem.paragraph }
    text_fr { Faker::Lorem.paragraph }
    pushed { [true, false].sample }
  end
end
