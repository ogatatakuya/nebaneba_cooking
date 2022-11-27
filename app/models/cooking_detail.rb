class CookingDetail < ApplicationRecord
  belongs_to :cooking
  has_one_attached :image
  
  validates :image, presence: true
 
  validates :introduction, presence: true
end
