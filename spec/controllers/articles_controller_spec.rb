require 'rails_helper'

describe ArticlesController, :type => :controller do

  describe "index action" do

    it "renders show template if item" do
      get :index 
      expect(response).to render_template('index')
    end

  end


  describe "show action" do

    it "renders show template if item id" do
      article = create(:article)
      get :show, params: { id: article.id }
      expect(response).to render_template('show')
    end
    
  end

  describe "create action" do
    
    it "redirect to show page if article create" do
      post :create, params: {article: {title: 'name !', text: 'some text'}} 
      expect(response).to redirect_to(article_path(assigns(:article)))
    end

    it "redirect to new page if article not create" do
      post :create, params: {article: {title: nil, text: nil}} 
      expect(response).to render_template('new')
    end

  end 

  describe "destroy action" do
    
    it "redirects to index action when article destroyed" do
      article = create(:article)
      delete :destroy, params: {id:article.id}
      expect(response).to redirect_to(articles_path)
    end

  end

  describe "update action" do

    it "redirect to show page if articles was updated" do
      article = create(:article)
      put :update, params: { article: { title: 'some title', text: 'text' }, id: article.id}
      expect(response).to redirect_to(article_path(assigns(:article)))
    end

  end
end