Rails.application.routes.draw do
  get 'bookings/new'
  # get 'airports/index'

  resources :flights
  resources :bookings
  resources :passengers
  root 'flights#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
