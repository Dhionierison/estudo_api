class Product < ApplicationRecord
  validates :name, :description, :quantidade, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantidade, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end