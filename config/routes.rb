Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root to: 'records#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  resources :records
  resources :relationships, only: [:create, :destroy]
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
