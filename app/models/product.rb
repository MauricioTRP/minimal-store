class Product < ApplicationRecord
  # =============== Validations ===================
  validates :title, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: true

  # ============== Relations ======================
  has_many :line_items

  # ============== Hooks ==========================
  before_destroy :check_references_by_line_item

  private

  # ensure that line items are not referencing a given product Hook
  def check_references_by_line_item
    unless line_items.empty?
      errors.add(:base, 'You cant destroy this product. Line items are present')
      throw :abort
    end
  end
end
