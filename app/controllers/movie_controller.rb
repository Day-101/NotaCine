class MovieController < ApplicationController
	def new

	end

	def create
		ImdbApi.add_from_name(params["title"])
	end
end
