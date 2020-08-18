Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :studios, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end

  resources :users do
    resources :studios, only: [:update, :edit, :destroy]
    resources :bookings, only: [:show, :index]
  end

  resources :bookings, only: [:update, :edit, :destroy]
end
