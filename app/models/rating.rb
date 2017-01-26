class Rating < ActiveRecord::Base
  belongs_to :beer
  
  def to_s
    "#{beer.name} #{score}"  #self.score
  end
end
