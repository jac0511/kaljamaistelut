class Brewery < ActiveRecord::Base

  include AverageRating

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers
  
  def average_rating
    self.ratings.average(:score)
  end
end
