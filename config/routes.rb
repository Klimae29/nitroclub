Rails.application.routes.draw do
  devise_for :users

  # Page d'accueil
  root to: "cars#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes pour les voitures et réservations
  resources :cars, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :rentals, only: [:new, :create], shallow: true
  end

  # Routes pour gérer l'acceptation/rejet des réservations
  resources :rentals, only: [:index, :show, :update, :destroy] do
    member do
      patch :accept
      patch :reject
    end
  end

  # Voir le dashboard de l'utilisateur
  get "/dashboard", to: "pages#dashboard", as: :user_dashboard
end
