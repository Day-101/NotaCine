class MovieController < ApplicationController
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
end
