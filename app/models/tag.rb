class Tag < ApplicationRecord
  
  has_many :cookings, through: :tagmaps
  #has_many :tagmaps, dependent: :destroy
  
  validates :name, presence: true
end
