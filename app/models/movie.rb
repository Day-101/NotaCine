class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  attribute :description, default: "No description"
  attribute :year, default: "0"
  attribute :director, default: "Unknown"
  attribute :actors, default: "Unknown"
  attribute :image_url, default: "https://m.media-amazon.com/images/M/MV5BODA4NTk3MTQwN15BMl5BanBnXkFtZTcwNjUwMTMxNA@@._V1_Ratio0.6791_AL_.jpg"

  has_many :notations, dependent: :destroy
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres


	def self.save_movie(result)		
		new_movie = Movie.new
		new_movie.title = result["title"] if result["title"]
		new_movie.description = result["plot"] if result["plot"]
		new_movie.year = result["year"] if result["year"]
		new_movie.actors = result["stars"] if result["stars"]
		new_movie.director = result["directors"] if result["directors"]
		new_movie.image_url = result["image"] if result["image"]

		if new_movie.save
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

	def already_reviewed(user)
    Notation.find_by(user: user,movie: self).present?
  end

	def notacine_reviews(criteria)
		reviews = Notation.where(movie:self) 
		reviews = reviews.select{|review| review.user.rank == 0}
		criteria_review(reviews, criteria)
	end

	def all_reviews(criteria)
		reviews = Notation.where(movie:self) 
		criteria_review(reviews, criteria)
	end

	def criteria_review(reviews, criteria)
		count = 0
		notation = 0
		reviews.each do |review|

			case criteria
				when "scenario"
					notation += review.scenario
				when "image"
					notation += review.image
				when "editing"
					notation += review.editing
				when "sound"
					notation += review.sound
				when "makeup"
					notation += review.makeup
				when "directing"
					notation += review.directing
			end
			count +=1
		end
		if count == 0
			return 0
		else
			return notation/count
		end
	end

	def reviewed_by_admin
		reviewed = false
		User.where(rank: 0).each {|user| reviewed = true if Notation.find_by(movie: self, user: user)}
		return reviewed
	end

	def self.last_four
		if Movie.all.size >= 4
			return Movie.all.drop(Movie.all.size - 4)
		else
			return Movie.all 
		end
	end

	def self.search(search)
		return Movie.all if search.empty?
		if search[:search].empty?
			@movies = Movie.all
		else
			@movies = Movie.regex_search(search[:search])
		end
		@movies = Movie.categories_search(@movies, search[:categories]) unless search[:categories].nil?
		@movies = Movie.criteria_ordering(@movies, search[:criteria]) unless search[:criteria].nil?
			
		return @movies
	end

	def self.regex_search(word_match)
		results = []
		regex = Regexp.new( word_match, Regexp::IGNORECASE)
		Movie.all.each do |movie|
			if movie.title.match(regex)
				results << movie
			end
		end
		return results
	end

	def self.categories_search(movies, cat_array)
		results = []
		cat_array.each do |cat_id|
		 results << movies.select{|movie| MovieGenre.find_by(genre: Genre.find(cat_id), movie: movie)}
		end
		return results.flatten
	end

	def self.criteria_ordering(movies, criteria)
		 movies = movies.sort_by {|movie| Movie.rating_average(movie, criteria)}.reverse
		 return movies.select{|movie| Movie.rating_average(movie, criteria) >= 50}
	end

	def self.rating_average(movie, criteria)
		rating = 0
		count = 0
		criteria.each do |criterion|
			rating += movie.notacine_reviews(criterion)
			count += 1
		end
		return rating/count
	end
end





