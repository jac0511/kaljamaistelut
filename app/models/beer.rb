class Beer < ActiveRecord::Base

  include AverageRating

  has_many :ratings, dependent: :destroy
  belongs_to :brewery
  belongs_to :style
  has_many :users, -> { uniq }, through: :ratings
  
  validates :name, presence: true
  validates :style, presence: true
    
  def to_s
    "#{brewery.name} — #{name}"
  end
end
