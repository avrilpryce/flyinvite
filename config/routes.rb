Rails.application.routes.draw do
  get 'invitations/new'
  get 'invitations/create'
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :invitations, only: [ :new, :create ]
  end
end
