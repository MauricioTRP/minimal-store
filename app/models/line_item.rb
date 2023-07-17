class LineItem < ApplicationRecord
  # ========== Relations ====================
  belongs_to :product
  belongs_to :cart
end
