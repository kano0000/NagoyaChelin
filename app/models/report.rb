class Report < ApplicationRecord
  
  belongs_to :user
  belongs_to :store
  
  validates :report, presence: true, length: {in: 2..200}

end