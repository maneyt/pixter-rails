class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many(:images, dependent: :destroy)
  has_many :likes, as: :likeable

  validates :name, presence: true
end
