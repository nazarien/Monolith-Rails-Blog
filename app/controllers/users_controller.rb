class UsersController < ApplicationController
  include ArticlesHelper

  def index
    @users = User.all
  end

  def show
    @articles = articles_for_user    
  end
end
