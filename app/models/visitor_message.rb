class VisitorMessage < ApplicationRecord
  validates :email, 
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, }
  validates :message, 
  presence: true,
  length: {maximum: 120}
end
