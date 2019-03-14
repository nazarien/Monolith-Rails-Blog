class ArticlePolicy < ApplicationPolicy

  def initialize(current_user, article)
    @current_user = current_user
    @article = article
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    @current_user.author?
  end

  def create?
    @current_user.author? 
  end

  def edit?
    owner_article
  end

  def update?
    owner_article
  end

  def destroy?
    owner_article
  end

  private 
  
  def owner_article
    @current_user.author? && @current_user.id == @article.user_id
  end
end