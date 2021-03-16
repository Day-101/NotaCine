class ImdbApi

 	def self.add_from_name(movie_name)
		movie_name = movie_name.gsub(/ /, "%20")
		api_key = ENV["IMDBAPI"]
		url = "https://imdb-api.com/en/API/SearchMovie/#{api_key}/#{movie_name}"
		buffer = URI.open(url).read
		result = JSON.parse(buffer)
		movie_id =  result["results"][0]["id"]
		add_from_id(movie_id)
	end

	def self.add_from_id(movie_id)
		api_key = ENV["IMDBAPI"]
		url = "https://imdb-api.com/fr/API/Title/#{api_key}/#{movie_id}"
		buffer = URI.open(url).read
		result = JSON.parse(buffer)
		Movie.save_movie(result)
	end

end