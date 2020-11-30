Rails.application.routes.draw do
  post 'search_flights', to: 'flight_bookings#find_location'
  get 'search_flights', to: 'flight_bookings#flight_search'
  devise_for :users
  root to: 'pages#home'

  resources :trips do
    resources :invitations, only: [ :new, :create ]
    resources :flight_bookings, only: [ :new, :create ]
  end
  resources :invitations, only: [ :index, :show, :update ]
  resources :flight_bookings, only: [ :destroy, :update ]
end

  # verb 'path', to: 'controller#action'