class AvatarsController < ApplicationController
	 def create
  	@user = User.find(params[:user_id])
  	if @user == current_user
  		@user.avatar.attach(params[:avatar])
  		redirect_to user_path(@user)
  	end
  end
end
