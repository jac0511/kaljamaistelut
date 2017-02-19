class Style < ActiveRecord::Base
  has_many :beers
  validates :name, presence: true
  validates :name, uniqueness: true
end
