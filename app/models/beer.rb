class Beer < ActiveRecord::Base

  include AverageRating

  has_many :ratings, dependent: :destroy
  belongs_to :brewery
  has_many :users, -> { uniq }, through: :ratings
  
  validates :name, presence: true
    
  def to_s
    "#{brewery.name} — #{name}"
  end
end
