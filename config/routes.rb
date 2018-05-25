Rails.application.routes.draw do
  devise_for :users


  get 'dashboard', to: 'pages#dashboard'
  resources :bookings, only: [:update, :destroy]

  # resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :bookings, except: [:index, :new]
    resources :reviews, only: [:create]
  end
end
