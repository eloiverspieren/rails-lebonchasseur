Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :hunts, only: [:index, :show] do
    resources :availabilities, only: [:show]
    resources :reviews, only: [:index, :show, :new, :create, :destroy]
  end

  namespace :account do
    resources :hunts do
      resources :availibilities
      resources :reviews
      resources :bookings, only: [:index, :create]
    end
    resource :profile
    resources :bookings
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
