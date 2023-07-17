class Cart < ApplicationRecord
  # ========= Validations ================
  validates_associated :line_items

  # =========== Relations ================
  has_many :line_items, dependent: :destroy
end
