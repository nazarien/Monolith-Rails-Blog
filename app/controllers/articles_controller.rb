class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :authenticate_user!, except: :index
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params(:id))
  end

  def new
    @article = Article.new
  end
  
  def edit
    set_article
  end
  
  def create
    @article = articles_for_user.new(article_params)

    if @article.save
      redirect_to users_show_path
    else
      render 'new'
    end
  end

  def update
    if set_article.update(article_params)
      redirect_to set_article
    else
      render 'edit'
    end
  end

  def destroy
    set_article.destroy
  
    redirect_to users_show_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article ||= articles_for_user.find(params[:id])
  end
end