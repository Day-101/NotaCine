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


	def self.save_movie(result)		
		new_movie = Movie.new
		new_movie.title = result["title"] if result["title"]
		new_movie.description = result["plot"] if result["plot"]
		new_movie.year = result["year"] if result["year"]
		new_movie.actors = result["stars"] if result["stars"]
		new_movie.director = result["directors"] if result["directors"]
		new_movie.image_url = result["image"] if result["image"]
		new_movie.save

		genres = result["genreList"]
		genres.each do |genre|
			if Genre.find_by(title: genre["value"])
				this_genre = Genre.find_by(title: genre["value"])
			else
				this_genre = Genre.create(title: genre["value"])
			end
			MovieGenre.create(movie: new_movie, genre: this_genre)
		end
	end

end
