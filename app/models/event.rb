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
class Event < ApplicationRecord
  extend Mobility
  translates :title, type: :string
  translates :text, type: :text

  validates :title, presence: true
  validates :text, presence: true
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :expiry_date, presence: true

  has_attached_file :image,
                    storage: :s3,
                    preserve_files: true,
                    s3_permissions: {
                        original: "private"
                    },
                    styles: { medium: "1260x712>",
                              thumb: "400x400>" },
                    # default_url: "/images/:style/missing.png",
                    url: ':s3_alias_url',
                    # :s3_host_alias should be the CNAME you have set up.
                    s3_host_alias: Rails.application.credentials.config[:aws_s3_host_alias],
                    path: "#{Rails.env}/images/:class/:id-:style-:updated_at.:extension",
                    s3_credentials: {
                        bucket: Rails.application.credentials.config[:aws_s3_bucket],
                        s3_region: Rails.application.credentials.config[:aws_s3_region],
                    }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
