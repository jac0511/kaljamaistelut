class BeerClub < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, -> { uniq }, through: :memberships
  def to_s
    "#{name}, #{city}"
  end
end
