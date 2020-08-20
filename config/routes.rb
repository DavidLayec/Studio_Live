Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :studios, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy]

  # pundit handles.. but focus on core user journey
  # resources :users do
  #   resources :studios, only: [:update, :edit, :destroy]
  #   resources :bookings, only: [:show, :index]
  # end
end
