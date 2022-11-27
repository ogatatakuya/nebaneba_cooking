class Cooking < ApplicationRecord
  
  has_one_attached :image
  #has_many_attached :images
  
  has_many :cooking_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :cooking_details
  belongs_to :member
#   has_many :tagmaps, dependent: :destroy
  belongs_to :tag#, through: :tagmaps
  
  
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  
  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
  
  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end
  
  #def save_cookings(tags)
  # current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
  # old_tags = current_tags - tags
  # new_tags = tags - current_tags

   # Destroy
  # old_tags.each do |old_name|
  #   self.tags.delete Tag.find_by(tag_name:old_name)
  # end

    #Create
  # new_tags.each do |new_name|
  #   cooking_tag = Tag.find_or_create_by(tag_name:new_name)
  #   self.tags << cooking_tag
 #  end
  #end
end
