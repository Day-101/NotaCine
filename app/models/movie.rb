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

 	def self.add_from_name(movie_name)
		movie_name = movie_name.gsub(/ /, "%20")
		api_key = ENV["IMDBAPI"]
		url = "https://imdb-api.com/en/API/SearchMovie/#{api_key}/#{movie_name}"
		buffer = URI.open(url).read
		result = JSON.parse(buffer)
		movie_id =  result["results"][0]["id"]
		return add_from_id(movie_id)
	end

	def self.add_from_id(movie_id)
		api_key = ENV["IMDBAPI"]
		url = "https://imdb-api.com/fr/API/Title/#{api_key}/#{movie_id}"
		buffer = URI.open(url).read
		result = JSON.parse(buffer)
		
		new_movie = Movie.new
		new_movie.title = result["title"] if result["title"]
		new_movie.description = result["localPlot"] if result["localPlot"]
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
