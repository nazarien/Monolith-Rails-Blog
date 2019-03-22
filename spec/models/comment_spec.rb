require 'rails_helper'

RSpec.describe Comment, type: :model do
  before (:each) do
    @comment_for_article = create(:comment, :for_article)
    @comment_for_user = create(:comment, :for_user)
    @article = { title: "exsample1 title", text: "exsample text", id:  1 }
    @user = { email: 'name@gmail.com', password: '123456', password_confirmation: '123456', id: '1' }
  end

  it "is valid with valid attributes and commentable exist" do
    expect(@comment_for_article).to be_valid
  end

  it "is not valid without commentable" do
    @comment_for_user.commentable = nil
    expect(@comment_for_user).to_not be_valid
  end

  it "has commentable type 'User'" do
    @comment_for_user.commentable_type == 'User'
  end

  it "has commentable id the same as user id" do
    @comment_for_user.commentable_id == @user[:id]
  end

  it "has commentable id the same as user id" do
    @comment_for_article.commentable_id == @article[:id]
  end
end
