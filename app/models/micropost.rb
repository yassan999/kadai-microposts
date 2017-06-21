class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence:true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favoriting, through: :favorites, source: :user
  
end
