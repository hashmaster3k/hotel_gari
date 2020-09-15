Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # main controller
  root 'main#index'

  get '/accommodations', to: 'accommodations#index'

  get '/amenities', to: 'amenities#index'

  get '/bookings', to: 'bookings#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  namespace :user do
    get '/profile', to: 'profile#index'
    get '/profile/info', to: 'profile#show'
    get '/profile/edit', to: 'profile#edit_info'
    patch '/profile', to: 'profile#update_info'
    get '/profile/password', to: 'profile#edit_password'
    patch '/profile/password', to: 'profile#update_password'
  end
end
