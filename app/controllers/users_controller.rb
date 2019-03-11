class UsersController < ApplicationController
  include ArticlesHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
end
