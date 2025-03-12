class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :name, presence: true
  validates :style, presence: true, inclusion: { in: %w[stance muscle neon sono offroad mini] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :year, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :public_id, presence: true, uniqueness: true
end
