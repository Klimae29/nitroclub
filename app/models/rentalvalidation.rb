class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validates :status, inclusion: { in: ["En cours", "Validé", "Refusé"] }

  private

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
