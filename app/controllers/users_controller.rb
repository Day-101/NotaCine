class UsersController < ApplicationController
before_action :redirect_if_not_admin, only: [:destroy, :update]

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

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      flash.notice = "#{user.username} is now rank : #{user.rank}"
    else
      flash.alert = user.errors.full_messages.to_sentence
    end
    redirect_to user
  end

  private

  def user_params
    params.require(:user).permit(:rank)
  end

  def redirect_if_not_owned
    redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
  end
end
