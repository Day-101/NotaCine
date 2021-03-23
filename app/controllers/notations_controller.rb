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

  def edit
    @notation= Notation.find(params[:id])
    @movie= Movie.find(params[:movie_id])
  end

  def update
    @movie= Movie.find(params[:movie_id])
    @notation= Notation.find(params[:id])
    @notation.update(notation_params)
    
    if @notation.save
      flash.notice= "Review successfully updated"
      redirect_to @movie
    else
      flash.now.alert= @notation.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    notation= Notation.find(params[:id])
    notation.destroy
    flash.notice = "Notation sucessfully deleted "
    redirect_to user_path(notation.user)
  end
  private

  def notation_params
    params.require(:notation).permit(:scenario, :image, :editing, :sound, :makeup, :directing)
  end

end
