class Comment < ApplicationRecord
  mount_uploader :comment_image, ImageUploader
  belongs_to :user
  belongs_to :topic
  validates :contents, presence: true
  default_scope -> { order(created_at: :desc) }

end
