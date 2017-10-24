Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'

  resources :users, except: [:show]
  get '/profile', to: "users#show", as: :profile
  get '/admin', to: "users#admin", as: :admin

  resources :sessions, only: %i( new create destroy )

  resources :restaurants do
    patch '/reservations/:id', to: "reservations#confirm", as: :reservation_confirm
    put '/reservations/:id', to: "reservations#cancel", as: :reservation_cancel
    resources :reservations, only: [:new, :create]
  end
end
