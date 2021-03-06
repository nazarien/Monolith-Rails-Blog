class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @articles = @user.articles
    authorize current_user
  end

  def get_user
    @user = User.find(params[:id])
  end
end
