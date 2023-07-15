class Product < ApplicationRecord


  # =============== Validations ===================
  validates :title, presence: true
  validates :price, presence: true
end
