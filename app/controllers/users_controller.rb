class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @notation = Notation.where(user_id: @user).last
    @movie = Notation.where(user_id: @user).last.movie_id
    @lastmovie = Movie.find(@movie)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def redirect_if_not_owned
    redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
  end
end
