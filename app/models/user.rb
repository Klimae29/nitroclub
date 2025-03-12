class User < ApplicationRecord
  # Modules Devise pour l'authentification
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations avec les voitures
  has_many :cars, dependent: :destroy

  # Locations que l'utilisateur effectue en tant que locataire
  has_many :rentals, dependent: :destroy

  # Locations dont l'utilisateur est le propriétaire de la voiture
  has_many :rentals_as_owner, class_name: 'Rental', foreign_key: 'car_user_id', dependent: :destroy
end
