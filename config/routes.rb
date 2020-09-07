Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # main controller
  get '/', to: 'main#index'

  get '/accommodations', to: 'accommodations#index'

  get '/amenities', to: 'amenities#index'

  get '/bookings', to: 'bookings#index'

  get '/login', to: 'sessions#index'

  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show'
end
