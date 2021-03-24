class AdminsController < ApplicationController
before_action :authenticate_user!
before_action :redirect_if_not_admin


  def show

  end

end
