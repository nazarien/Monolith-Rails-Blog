class CommentPolicy < ApplicationPolicy

  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def index 
    true
  end 

  def create?
    false
  end

  def destroy?
    false
  end    
end