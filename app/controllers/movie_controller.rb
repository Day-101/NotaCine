class MovieController < ApplicationController
	def new

	end

	def create
		puts Movie.add_from_name(params["title"])
	end
end
