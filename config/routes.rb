Rails.application.routes.draw do
  root to: 'records#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :followings
      get :followers
      #get :likes
    end
    collection do
      get :search
    end
  end

  resources :records do
    resources :likes, only: [:create, :destroy]
    resources :comment, only: [:create, :destroy]  
  end

  resources :relationships, only: [:create, :destroy]
  #resources :likes, only: [:create, :destroy]
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
