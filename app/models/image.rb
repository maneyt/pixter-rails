class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  validates :url, presence: true
  validates :gallery, presence: true
end
