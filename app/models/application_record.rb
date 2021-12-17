class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def format_phone_number()
    if phone_number
      unless phone_number.match?(/\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/)
        errors.add(:phone_number, "Numéro non valide en France")
      end
    end
  end
end
