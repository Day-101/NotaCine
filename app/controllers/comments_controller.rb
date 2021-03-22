class CommentsController < ApplicationController
  before_action :authenticate_user!

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

  
  

  private

  def comment_params
  params.require(:comment).permit(:content) 

  end


end
