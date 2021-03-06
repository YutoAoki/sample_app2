class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :topic_image, ImageUploader


  validates :topic_name, presence: true
  VALID_TOPIC_REGEX = /\A[0-9A-Za-z]+\z/
  validates :topic_search_id, format: { with: VALID_TOPIC_REGEX },
            presence: true, length: { minimum: 6 },
            uniqueness: { case_sensitive: false }

  validates :topic_image, presence: true
  has_many :miles
  has_many :relationships
  has_many :users, through: :relationships
  validate :picture_size
  # has_many :mile_users, through: :miles, sourse: 'user'
  private
    def picture_size
      if topic_image.size > 3.megabytes
        errors.add(:topic_image, "画像サイズが大きすぎます。3MB以下の画像に変更してください。")
      end
    end

end

# validates :email, presence: true, length: { maximum: 255 },


# /^[a-zA-Z0-9]+$/　　（うまくいかなかった）

# /^[0-9A-Za-z]+$/　　（これもうまくいかない）

# バリデーションが厳しくなった？ ^→\A $→\zを使うらしい。
# →参考：http://jumperson.hatenablog.com/entry/2013/06/27/062237
