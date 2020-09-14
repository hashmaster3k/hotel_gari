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

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'

  namespace :user do
    get '/profile', to: 'profile#show'
  end
end
