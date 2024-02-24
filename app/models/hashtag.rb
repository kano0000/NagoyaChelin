class Hashtag < ApplicationRecord

  has_many :hashtag_stores, dependent: :destroy
  has_many :stores, through: :hashtag_stores

  validates :hashname, presence: true, length: { maximum: 50}
end
