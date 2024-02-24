class HashtagStore < ApplicationRecord
  belongs_to :store
  belongs_to :hashtag
  
  validates :store_id, presence: true
  validates :hashtag_id, presence: true
end
