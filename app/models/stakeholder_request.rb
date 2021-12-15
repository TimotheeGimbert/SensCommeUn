class StakeholderRequest < ApplicationRecord
  attr_accessor :stakeholder_category
  validates :message, length: {maximum: 140 }, presence: true

  belongs_to :user
  belongs_to :organization
end
