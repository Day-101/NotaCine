class MoviesController < ApplicationController
	before_action :authenticate_user!, only:[:edit, :update, :delete, :new, :create]
	before_action :redirect_if_not_admin, only:[:edit, :update, :delete, :new, :create]

	def index
		@movies = Movie.all
		respond_to do |format|
			format.html {}
			format.json { 
				response.set_header("Access-Control-Allow-Origin", "*")
				render json: @movies }
		end
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new
		@movie= Movie.new
	end

	def create
		ImdbApi.add_from_name(params["movie"]["title"])
		redirect_to root_path
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

	

end
