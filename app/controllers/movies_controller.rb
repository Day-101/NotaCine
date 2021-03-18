class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new

	end

	def create
		ImdbApi.add_from_name(params["title"])
	end

#=======================================================================================================================
	private

	def movie_params
		params.require(:movie).permit(:year, :director, :title, :description, :actors, :image_url)
	end
end
