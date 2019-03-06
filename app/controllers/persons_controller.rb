class PersonsController < ApplicationController
  def profile
    @users = User.all
  end
  def show
    @articles = current_user.articles    
  end
end
