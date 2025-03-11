Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Routes pour les voitures
  resources :cars, only: [:show, :index, :new, :create] do
    resources :rentals, only: [:create]
  end

  resources :cars, only: [:edit, :update, :destroy]

  # Routes pour les locs (index et show seront sur pages)
  resources :rentals, only: [:index, :show, :update, :destroy]

  # Voir les resas de users
  get '/dashboard', to: 'pages#dashboard'
end
