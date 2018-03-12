class Post < ApplicationRecord
  acts_as_taggable
	has_many :comments
	has_many :images
	has_attached_file :image, 
	styles: { medium: "200x200#", thumb: "100x100#" },
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region => ENV['AWS_REGION']
    }
  

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	extend FriendlyId
  		friendly_id :title, use: :slugged

end
