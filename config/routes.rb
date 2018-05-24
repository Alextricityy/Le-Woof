Rails.application.routes.draw do
  devise_for :users


  get 'dashboard', to: 'pages#dashboard'


  # resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :bookings, only: [:create, :show]
    resources :reviews
  end
end
