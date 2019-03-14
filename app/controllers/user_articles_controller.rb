class UserArticlesController < ApplicationController
  def index
    @saved_aritcles = current_user.favorite_articles
  end

  def create
    unless current_user.favorite_articles.include?(find_article)
      current_user.favorite_articles << find_article
    end
    redirect_to articles_path
  end

  def destroy
    current_user.favorite_articles.delete(find_article)
    redirect_to user_articles_path
  end

  private

  def parametrs
    params.permit(:id)
  end

  def find_article
    @article ||= Article.find(parametrs[:id])
  end
end
