class Brewery < ActiveRecord::Base

  include AverageRating

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers
  
  validates :name, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1041 }
  validate :years
  
  def years
    if self.year > Time.now.year
      errors.add(:year, "can't be in the future")
    end
  end
      
  def average_rating
    self.ratings.average(:score)
  end
end
