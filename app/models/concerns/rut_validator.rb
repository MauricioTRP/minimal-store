#frozen_string_literal = true

# Custom method to validate Chilean Rut on User Model
class RutValidator < ActiveModel::Validator
  def validate(record)
    rut, control = record.rut.split(/-/)
    unless control_digit(rut).downcase == control.downcase
      record.errors.add :rut, "the controll number should be #{control_digit(record)}"
    end
  end

  private

  def control_digit(rut)
    sum = rut.gsub(/\D/, '').reverse.split('').each_with_index
             .map { |d, i| d.to_i * (i % 6 + 2) }.sum
    controll_digit = 11 - sum % 11
    case controll_digit
    when 10
      'k'
    when 11
      '0'
    else
      controll_digit.to_s
    end
  end
end
