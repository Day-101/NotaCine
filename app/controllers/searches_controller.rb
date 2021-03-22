class SearchesController < ApplicationController
	def new
		@movies = Movie.search(search_params)
	end

	def create
		redirect_to search_path(search_params)
	end

	private 
	def search_params
		params.permit(:search, :categories => [], :criteria => [])
	end
end
