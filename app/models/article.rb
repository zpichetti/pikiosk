class Article < ApplicationRecord
  belongs_to :board
  mount_uploader :photo, PhotoUploader
end
