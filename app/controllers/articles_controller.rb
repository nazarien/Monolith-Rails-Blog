class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end
  
  def show
    set_article
  end

  def new
    @articles = articles_for_user
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

  def articles_for_user
    current_user.articles
  end

end