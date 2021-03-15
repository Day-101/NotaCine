class Genre < ApplicationRecord
  validates :title, presence: true

  has_many :movie_genres
  has_many :movies, through: :movie_genres
end
