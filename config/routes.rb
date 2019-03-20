Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  get '/users/:id', to: 'users#get_user', as: :get_user
  get '/user/my_article', to: 'users#show', as: :show

  resources :user_articles
  resources :articles 
  resources :users
  resources :comments
  
  root 'welcome#index'
end
