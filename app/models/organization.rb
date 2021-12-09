class Organization < ApplicationRecord
  belongs_to :city
  belongs_to :status
  belongs_to :activity_sector
  has_many :external_stakeholders
  has_many :user, through: :external_stakeholders
  has_many :activities
end
