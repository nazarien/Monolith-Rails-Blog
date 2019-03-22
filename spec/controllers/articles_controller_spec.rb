require 'rails_helper'

describe ArticlesController, :type => :controller do
  before (:each) do 
    @user = create(:user)
    @article = create(:article)
    sign_in(@user)
  end

  describe "index action" do
    it "renders index template if item" do
      get :index 
      expect(response).to render_template('index')
    end
  end


  describe "show action" do
    it "renders show template if item id" do
      get :show, params: { id: @article.id, user: @user }
      expect(response).to render_template('show')
    end    
  end

  describe "create action" do
    it "redirect to show page if article create" do
      post :create, params: { article: { title: 'name !', text: 'article' } } 
      expect(response).to redirect_to(article_path(@article.id))
    end

    it "redirect to new page if article not create" do
      post :create, params: { article: { title: nil, text: nil } } 
      expect(response).to render_template('new')
    end
  end 

  describe "destroy action" do
    it "redirects to index action when article destroyed" do
      delete :destroy, params: { id: @article.id }
      expect(response).to redirect_to(user_path(@user.id))
    end
  end

  describe "update action" do
    it "redirect to show page if articles was updated" do
      @article.user_id = @user.id
      @article.save
      put :update, params: { article: { title: 'some title', text: 'text' }, id: @article.id}
      expect(response).to redirect_to(article_path(@article.id))
    end
  end
end