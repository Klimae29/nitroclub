class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :style, presence: true, inclusion: { in: %w[stance muscle neon sono offroad mini] }
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today.year }
  validates :description, presence: true, length: { maximum: 255 }
  validates :public_id, presence: true, uniqueness: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end
