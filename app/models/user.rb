class User < ActiveRecord::Base
  include AverageRating
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 30 } 
  validates :password, length: { minimum: 4 }
  has_secure_password
  
  has_many :ratings, dependent: :destroy
  has_many :beers, -> { uniq }, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, -> { uniq }, through: :memberships
end
