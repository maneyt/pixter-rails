class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments

  has_many :group_images
  has_many :groups, through: :group_images

  validates :url, presence: true
  validates :gallery, presence: true
end
