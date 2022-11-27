class CookingComment < ApplicationRecord
  
  belongs_to :member
  belongs_to :cooking
  
   validates :comment, presence: true, length: { maximum: 1000 }
end
