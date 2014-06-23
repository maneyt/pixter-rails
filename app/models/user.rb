class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
