class Image < ActiveRecord::Base
  belongs_to :gallery

  validates :url, presence: true
  validates :gallery, presence: true
end
