FactoryBot.define do
  factory :link do
    title_en { Faker::Lorem.paragraph }
    title_it { Faker::Lorem.paragraph }
    title_de { Faker::Lorem.paragraph }
    title_fr { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
  end
end
