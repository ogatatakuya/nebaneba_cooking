class Bookmark < ApplicationRecord
  
  belongs_to :cooking
  belongs_to :member
  
  validates :member_id, uniqueness: { scope: :cooking_id }
end
