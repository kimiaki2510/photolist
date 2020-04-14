Rails.application.routes.draw do
  root to: 'records#index'

  get 'signup', to: 'users#new'
  resources :records
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
