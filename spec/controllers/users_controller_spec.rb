require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success on index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "routing" do
    it "routes to #index" do
      expect(get: '/users').to route_to(controller: 'users', action: 'index')
    end
  end

  describe "GET #show" do
    it "returns http success on show" do
      user = create(:user)
      sign_in(user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "routing" do
    it "routes to #show" do
      expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
    end
  end

end
