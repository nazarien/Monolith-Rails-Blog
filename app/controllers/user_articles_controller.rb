class UserArticlesController < ApplicationController
  def index
    @saved_aritcles = current_user.favorite_articles
  end

  def create
    @favorite_article = current_user.user_articles.new(article_id: find_article.id)
    authorize @favorite_article
    if @favorite_article.save
      redirect_to articles_path
      flash[:alert] = "Saved"
    else
      redirect_to articles_path
      flash[:alert] = "Don't saved"
    end
  end

  def destroy
    authorize current_user
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
