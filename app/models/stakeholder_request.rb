class StakeholderRequest < ApplicationRecord
  attr_accessor :stakeholder_category #Use in form params for legalreps
  validates :message, length: {maximum: 140 }, presence: true

  belongs_to :user
  belongs_to :organization
end
