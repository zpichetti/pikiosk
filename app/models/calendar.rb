class Calendar < ApplicationRecord
  belongs_to :board

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :city, presence: true
end
