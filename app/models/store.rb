class Store < ApplicationRecord

  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  has_many :store_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :hashtag_stores, dependent: :destroy
  has_many :hashtags, through: :hashtag_stores

  has_one_attached :food_image

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 200}
  validates :address, presence: true
  validates :hashbody, presence:true


  after_create do
    store = Store.find_by(id: self.id)
    # hashbodyに打ち込まれたハッシュタグを検出
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の#を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      store.hashtags << tag
    end
  end

  #更新アクション
  before_update do
    store = Store.find_by(id: self.id)
    store.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      store.hashtags << tag
    end
  end


  def get_food_image(width,height)
    unless food_image.attached?
      file_path = Rails.root.join('app/assets/images/food_no_image.jpg')
      food_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    food_image.variant(resize_to_limit: [width,height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
