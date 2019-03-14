class UserPolicy < ApplicationPolicy

  def initialize(current_user, article)
    @current_user = current_user
    @article = article
  end

  def index 
    true
  end

  def show?
    @current_user.author?
  end    

  def create?
    @current_user.author?
  end

  def update?
    @current_user.author?
  end

  def destroy?
    @current_user.author?
  end
end