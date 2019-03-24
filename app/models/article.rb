class Article < ApplicationRecord
  belongs_to :board
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :photo, presence: true
end
