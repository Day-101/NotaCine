class NotationsController < ApplicationController

  def new
    @notation= Notation.new
    @movie= Movie.find(params[:movie_id])
  end

  def create
    @movie= Movie.find(params[:movie_id])
    @notation= Notation.new(notation_params)
    @notation.user= current_user
    @notation.movie= @movie
    if @notation.save
      flash.notice= "Review successfully created"
      redirect_to @movie
    else
      flash.now.alert= @notation.errors.full_messages.to_sentence
      render :new
    end
  end



  private

  def notation_params
    params.require(:notation).permit(:scenario, :image, :editing, :sound, :makeup, :directing)
  end

end
