class AvatarsController < ApplicationController
	 def create
  	@user = User.find(params[:user_id])
  	if params[:avatar]
	  	if @user == current_user
	  		@user.avatar.attach(params[:avatar])
	  		@user.scale_avatar
	  		redirect_to user_path(@user)
	  	end
	  end
  end
end
