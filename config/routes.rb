Rails.application.routes.draw do
  post 'search_flights', to: 'flight_bookings#find_location'
  delete 'search_flights', to: 'flight_bookings#destroy_flight_selection'
  
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :invitations, only: [ :new, :create ]
    resources :flight_bookings, only: [ :new, :create ]
    get 'search_flights', to: 'flight_bookings#flight_search'
  end
  resources :invitations, only: [ :index, :show, :update ]
  resources :flight_bookings, only: [ :destroy, :update ]
  resources :users, only: [ :index ]
end

  # verb 'path', to: 'controller#action'