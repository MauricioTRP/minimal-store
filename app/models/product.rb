class Product < ApplicationRecord
  # =============== Validations ===================
  validates :title, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: true
  validates_associated :line_items

  # ============== Relations ======================
  has_many :line_items
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100,100]
  end

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
