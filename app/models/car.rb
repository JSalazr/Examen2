class Car < ApplicationRecord
  validates :modelo, presence: true
  validates :price_per_day, numericality: {greater_than: 0}

  belongs_to :owner
  has_many :rents

  def self.categories
  ["Turismo", "Camioneta", "Pickup", "Bus"]
end
end
