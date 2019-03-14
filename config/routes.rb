Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  
  resources :user_articles
  resources :articles
  resources :users
  
  root 'welcome#index'
end
