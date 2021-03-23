class AdminsController < ApplicationController
before_action :authenticate_user!
before_action :redirect_if_not_admin


  def show

  end

  def create
    user = User.find_by(email: admin_params[:user_email])
    user.rank = admin_params[:rank].to_i
    if user.save
      flash.notice = "User : #{user.email} (#{user.username}) is now rank : #{user.rank}"
    else
      flash.alert = user.errors.full_messages.to_sentence
    end
    redirect_to "/admin"
  end

private

  def admin_params
    params.permit(:user_email, :rank)
  end
end
