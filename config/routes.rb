Rails.application.routes.draw do

  get 'bookings/new'

  get 'bookings/create'

  get 'availabilities/index'

  get 'availabilities/show'

  get 'hunts/index'

  get 'hunts/show'

  devise_for :users
  resources :hunts, only: [:index, :show] do
    resources :availabilities, only: [:show]
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :hunts do
      resources :availibilities
    end
    resources :profiles
    resources :bookings, only: [:index, :show]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
