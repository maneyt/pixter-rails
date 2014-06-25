class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :follows

  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def member?(group)
    groups.include?(group)
  end
  
  def join(group)
    groups << group
  end

  def leave(group)
    groups.destroy(group)
  end

  def like(image)
    liked_images << image
  end

  def liked?(image)
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
