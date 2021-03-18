class MoviesController < ApplicationController
	before_action :authenticate_user!, only:[:edit, :update, :delete]
	before_action :redirect_if_not_admin, only:[:edit, :update, :delete]

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

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(movie_params)
		if @movie.save 
			flash.notice = "Movie successfully updated"
			redirect_to @movie
		else
			render :edit
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash.notice = "Movie successfully deleted"
		redirect_to root_path
	end

#=======================================================================================================================
	private

	def movie_params
		params.require(:movie).permit(:year, :director, :title, :description, :actors, :image_url)
	end

	def redirect_if_not_admin
		redirect_to root_path flash.alert="You need to be admin to do that !" unless current_user.rank == 0
	end

end
