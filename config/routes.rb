Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :invitations, only: [ :new, :create ]
  end
  resources :invitations, only: [ :index, :show, :update ]
end
