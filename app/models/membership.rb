class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club
  
  def to_s
    "#{beer_club.name} (#{beer_club.city})"
  end
end
