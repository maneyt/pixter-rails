class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :follows

  has_many :likes, as: :likeable

  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def liked_images
    likes = Like.where(user_id: self.id, likeable_type: "Image")
    imgs = []
    likes.each do |like|
      imgs << Image.where(id: like.likeable_id).first
    end
    imgs
  end

  def liked_groups
    likes = Like.where(likeable_type: "Group", user_id: self.id)
    groups = []
    likes.each do |like|
      groups << Group.where(id: like.likeable_id).first
    end
    groups
  end

  def liked_galleries
    likes = Like.where(likeable_type: "Gallery", user_id: self.id)
    galleries = []
    likes.each do |like|
      galleries << Gallery.where(id: like.likeable_id).first
    end
    galleries
  end

  def member?(group)
    groups.include?(group)
  end
  
  def join(group)
    groups << group
  end

  def leave(group)
    groups.destroy(group)
  end


  def likes?(image)
    liked_images.include?(image)
  end

  def unlike(image)
    liked_images.destroy(image)
  end

  def followed?(user)
    followed_ids = []
    follows.each do |follow|
      followed_ids << follow.followed_id
    end
    followed_ids.include?(user.id)
  end
end
