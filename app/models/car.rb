class Car < ApplicationRecord
  belongs_to :user
  has_many :rental, dependent: :destroy
  validates :name, presence: true
  validates :style, presence: true, inclusion: { in: ["stance", "muscle", "neon", "sono", "offroad", "mini"] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 255 }
end
