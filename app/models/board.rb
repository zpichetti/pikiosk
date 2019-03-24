require 'json'
require "open-uri"

class Board < ApplicationRecord
  has_many :calendars
  has_many :articles

  validates :name, presence: true
  validates :location, presence: true

  def meteo
    f = "http://api.openweathermap.org/data/2.5/forecast?q="
    f += self.location
    f += "&appid="
    f += ENV["METEO_KEY"]
    f += "&units=metric"
    serialized_meteo = open(f).read
    JSON.parse(serialized_meteo)["list"]
  end

  def news
    
  end
end
