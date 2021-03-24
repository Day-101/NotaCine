class AdminsController < ApplicationController
before_action :authenticate_user!
before_action :redirect_if_not_admin


  def show
    @extrems_notations = Notation.extreme_notations
    @articles = Article.all
    @movies = Movie.all
    @users = User.all
  end

end
