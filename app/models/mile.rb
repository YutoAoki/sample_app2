class Mile < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  default_scope -> { order(created_at: :desc) }
end
