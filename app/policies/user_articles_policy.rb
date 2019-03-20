class UserArticlePolicy < ApplicationPolicy

  def initialize(current_user, saved_aritcles)
    @current_user = current_user
    @saved_aritcles = saved_aritcles
  end

  def index?
    false
  end

  def create?
    false
  end

  def destroy?
    false
  end
end