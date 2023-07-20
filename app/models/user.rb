class User < ApplicationRecord
  include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ========== Relations =======================
  has_one_attached :avatar

  # ========== Validations =====================
  validates_with RutValidator

  name_rgx = /[a-z\s.-]/i
  phone_rgx =  /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  name_message = "Only Letters and symbols , . ' - "
  phone_message = 'Invalid phone number'
  # [TODO] format rut before record creation
  validates :rut, uniqueness: { case_sensitive: false }
  validates :name, presence: true, format: { with: name_rgx, message: name_message }
  validates :last_name, presence: true, format: { with: name_rgx, message: name_message }
  validates :phone, presence: true, format: { with: phone_rgx, message: phone_message }
end
