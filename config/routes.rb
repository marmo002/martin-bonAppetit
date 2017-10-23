Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'

  resources :users
  resources :reservations, only: [:new, :create]
  resources :restaurants
  resources :sessions, only: %i( new create destroy )
end
