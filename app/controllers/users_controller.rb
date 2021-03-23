class UsersController < ApplicationController
before_action :redirect_if_not_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @notations = Notation.where(user_id: @user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.notice = "User succesfully destroyed"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def redirect_if_not_owned
    redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
  end
end
