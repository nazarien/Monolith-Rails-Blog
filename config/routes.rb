Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  get 'persons/profile', as: 'users'

  get 'persons/show'

  resources :articles, only: [:index, :show]

  resources :users do
    resources :articles, except: [:index, :show]
  end
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
