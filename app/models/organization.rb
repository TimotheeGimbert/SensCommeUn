class Organization < ApplicationRecord
  belongs_to :city
  belongs_to :status
  belongs_to :activity_sector
  has_many :legal_reps
  has_many :managers, through: :legal_reps, source: :user
  has_many :external_stakeholders
  has_many :users_stakeholders, through: :external_stakeholders, source: :user
  has_many :activities
  has_many :stakeholder_requests, dependent: :destroy
  has_many :stakeholder_demands, through: :stakeholder_requests, source: :user
end
