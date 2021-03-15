class Movie < ApplicationRecord
  validates :title, presence: true
  attribute :description, default: "No description"
  attribute :year, default: "0"
  attribute :director, default: "Unknown"
  attribute :actors, default: "Unknown"
  attribute :image_url, default: "https://m.media-amazon.com/images/M/MV5BODA4NTk3MTQwN15BMl5BanBnXkFtZTcwNjUwMTMxNA@@._V1_Ratio0.6791_AL_.jpg"

  has_many :notations
  has_many :movie_genres
  has_many :genres, through: :movie_genres
end
