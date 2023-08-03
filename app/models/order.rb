class Order < ApplicationRecord
  # ========== Validations =====================
  name_rgx = /[a-z\s.-]/i
  name_message = "Only Letters and symbols , . ' - "

  enum pay_type: {
    "Check": 0,
    "Credit card": 1,
    "Purchase order": 2
  }
end
