# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  link       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :link do
    title_en { Faker::Lorem.paragraph }
    title_it { Faker::Lorem.paragraph }
    title_de { Faker::Lorem.paragraph }
    title_fr { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
  end
end
