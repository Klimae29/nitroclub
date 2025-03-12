Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes pour les voitures (toutes les actions réunies)
  resources :cars, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :rentals, only: [:new, :create]
  end

  # Routes pour gérer les réservations (acceptation/rejet) depuis le dashboard
  resources :pages, only: [] do
    member do
      patch :accept_rental
      patch :reject_rental
    end
  end

  # Routes pour les réservations (index et show seront gérés par Pages)
  resources :rentals, only: [:index, :show, :update, :destroy]

  # Voir le dashboard de l'utilisateur
  get "/dashboard", to: "pages#dashboard"
end
