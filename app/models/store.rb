class Store < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 200}

  belongs_to :user
  has_many :store_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :store_image


  def get_store_image(width,height)
    unless store_image.attached?
      file_path = Rails.root.join('app/assets/images/store_no_image.jpg')
      store_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    store_image.variant(resize_to_limit: [width,height]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
