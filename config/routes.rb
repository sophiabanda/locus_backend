Rails.application.routes.draw do
  resources :meetings
  resources :venues
  resources :addresses
  resources :coordinates
  resources :states
  resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  get 'places_choices/', to: 'get_places_choices_from_midpoint#yelp'
  get 'ping', to: 'ping#main'
end
