class Genre < ApplicationRecord
  has_many :coffee_genres, dependent: :destroy
  has_many :post_coffees, through: :coffee_genres
end
