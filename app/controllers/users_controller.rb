class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @articles = current_user.articles    
  end
end
