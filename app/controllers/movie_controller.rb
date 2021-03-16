class MovieController < ApplicationController
	def new

	end

	def create
		Movie.add_from_name(params["title"])
	end
end
