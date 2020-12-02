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
<<<<<<< HEAD
  resources :flight_bookings, only: [ :destroy, :update ]
=======
  resources :users, only: [ :index ]
>>>>>>> 711f8e6b76ceed1a2717f54ec1b7a29fb272aff3
end

  # verb 'path', to: 'controller#action'