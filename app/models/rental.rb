class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user  # locataire, l'utilisateur qui fait la réservation
  belongs_to :owner, class_name: 'User' # propriétaire, l'utilisateur qui possède la voiture

  enum status: { pending: 0, accepted: 1, rejected: 2 }  # Statut de la réservation (en attente, acceptée, rejetée)

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :start_date_in_future, if: :pending?

  # Scope pour récupérer les réservations d'un locataire
  scope :for_user, ->(user) { where(user: user) }

  # Scope pour récupérer les réservations pour un propriétaire
  scope :for_owner, ->(owner) { where(owner: owner) }

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end

  # Validation spécifique pour les réservations en attente
  def start_date_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "doit être dans le futur")
    end
  end
end
