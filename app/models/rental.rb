class Rental < ApplicationRecord
  belongs_to :user # Locataire
  belongs_to :car
  belongs_to :owner, class_name: 'User' # Propriétaire de la voiture

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :start_date_in_future, if: :pending?
  validate :no_overlapping_rentals
  validate :rental_period_limit

  scope :for_user, ->(user) { where(user: user) if user.present? }
  scope :for_owner, ->(owner) { where(owner: owner) if owner.present? }

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end

  def start_date_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "doit être dans le futur")
    end
  end

  def no_overlapping_rentals
    overlapping_rentals = Rental.where(car: car)
                                .where.not(id: id)
                                .where("start_date < ? AND end_date > ?", end_date, start_date)

    if overlapping_rentals.exists?
      errors.add(:base, "Cette voiture est déjà réservée pour ces dates.")
    end
  end

  def rental_period_limit
    max_days = 300 # Réservation limitée à 300 jours
    if (end_date - start_date).to_i > max_days
      errors.add(:base, "Une réservation ne peut pas dépasser #{max_days} jours.")
    end
  end
end
