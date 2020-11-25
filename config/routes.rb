Rails.application.routes.draw do
  post 'search_flights', to: 'flight_bookings#find_location'
  get 'search_flights', to: 'flight_bookings#flight_search'
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :invitations, only: [ :new, :create ]
  end
  resources :invitations, only: [ :index, :show, :update ]
end

  # verb 'path', to: 'controller#action'