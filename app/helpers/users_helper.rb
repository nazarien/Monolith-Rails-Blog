module UsersHelper
  def articles_for_user
    current_user.articles
  end
end
