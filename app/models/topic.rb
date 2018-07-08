class Topic < ApplicationRecord
  belongs_to :user
  mount_uploader :topic_image, ImageUploader

end
