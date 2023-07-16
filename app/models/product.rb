class Product < ApplicationRecord
  # =============== Validations ===================
  validates :title, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: true
end
