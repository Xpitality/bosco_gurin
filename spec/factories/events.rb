include ActionDispatch::TestProcess

# == Schema Information
#
# Table name: events
#
#  id                 :bigint           not null, primary key
#  date_from          :date
#  date_to            :date
#  expiry_date        :date
#  image_content_type :string(255)
#  image_file_name    :string(255)
#  image_file_size    :bigint
#  image_updated_at   :datetime
#  text               :text(65535)
#  title              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :event do
    date_from { Faker::Date.forward(days: 23) }
    date_to { Faker::Date.forward(days: 33) }
    expiry_date { Faker::Date.forward(days: 35) }
    title_en { Faker::Lorem.sentence }
    title_it { Faker::Lorem.sentence }
    title_de { Faker::Lorem.sentence }
    title_fr { Faker::Lorem.sentence }
    text_en { Faker::Lorem.paragraph }
    text_it { Faker::Lorem.paragraph }
    text_de { Faker::Lorem.paragraph }
    text_fr { Faker::Lorem.paragraph }
    # image { fixture_file_upload('/bosco_gurin/spec/photos/test.png', 'image/png') }
    # image { fixture_file_upload(Rails.root.join('public', 'apple-touch-icon-precomposed.png'), 'image/png') }
  end
end
