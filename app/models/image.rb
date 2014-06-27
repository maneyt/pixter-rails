class Image < ActiveRecord::Base

  belongs_to :gallery
  has_many :comments

  has_many :likes

  has_many :image_tags
  has_many :tags, through: :image_tags

  has_many :group_images
  has_many :groups, through: :group_images

  validates :url, presence: true
  validates :gallery, presence: true

  def add_tag(tag)
    if !self.tags.include?(tag)
      tags << tag
    end
  end

  def untag(tag)
    tags.destroy(tag)
  end
end
