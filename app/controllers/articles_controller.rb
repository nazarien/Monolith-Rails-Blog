class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :authenticate_user!, except: :index
  
  def index
    @articles = Article.all
  end
  
  def show
    @article ||= Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize @article
  end
  
  def edit
    @article ||= Article.find(params[:id])
    authorize @article
  end
  
  def create
    @article = articles_for_user.new(article_params)
    authorize @article

    if @article.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def update
    if set_article.update(article_params)
      authorize @article
      redirect_to set_article
    else
      render 'edit'
    end
  end

  def destroy
    @article = articles_for_user.find(params[:id]).destroy
    authorize @article
  
    redirect_to user_path(current_user.id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article ||= articles_for_user.find(params[:id])
  end
end