class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_author, only: [:edit, :update]
  before_action :redirect_if_not_authorized, only: [:destroy]

  def create

    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.movie = Movie.find(params[:movie_id])

    if comment.save
      redirect_to comment.movie
    else
      flash.alert= comment.errors.full_messages.to_sentence
      redirect_to comment.movie
    end

  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to comment.movie
    else
      flash.alert= comment.errors.full_messages.to_sentence
      redirect_to comment.movie
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to Movie.find(params[:movie_id])
  end
  

  private

  def comment_params
  params.require(:comment).permit(:content) 

  end

  def redirect_if_not_author
    redirect_to root_path unless Comment.find(params[:id]).user == current_user
  end
 
  def redirect_if_not_authorized
    redirect_to root_path unless Comment.find(params[:id]).user == current_user || current_user.rank == 0
  end

end
