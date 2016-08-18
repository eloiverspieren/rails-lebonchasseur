Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :hunts, only: [:index, :show] do
    resources :availabilities, only: [:show]
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index, :show, :new, :create, :destroy]
  end

  namespace :account do
    resources :hunts do
      resources :availibilities
      resources :reviews
    end
    resource :profile
    resources :bookings, only: [:index, :show]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
