class Cart < ApplicationRecord
  # ========= Validations ================
  validates_associated :line_items

  # =========== Relations ================
  has_many :line_items, dependent: :destroy

  # ============ Methods ===================

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.sum(&:total_price)
  end
end
