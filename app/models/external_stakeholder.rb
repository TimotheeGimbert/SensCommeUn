class ExternalStakeholder < ApplicationRecord

  validate :format_for_email_if_exist

  belongs_to :organization
  belongs_to :stakeholder_category
  belongs_to :user, optional: true

  def format_for_email_if_exist
    if email 
      unless email.match?(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/) 
        errors.add(:email, "Erreur dans le format d'email")
      end
    end
  end
end
