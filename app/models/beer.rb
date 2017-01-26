class Beer < ActiveRecord::Base

  include AverageRating

  has_many :ratings, dependent: :destroy
  belongs_to :brewery
  
  def to_s
    "#{brewery.name} — #{name}"
  end
end
