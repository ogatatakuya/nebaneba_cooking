class Tag < ApplicationRecord
  
  has_many :cookings
  #has_many :tagmaps, dependent: :destroy
  
  #validates :name, presence: true
end
