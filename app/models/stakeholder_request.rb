class StakeholderRequest < ApplicationRecord
  attr_accessor :stakeholder_category

  belongs_to :user
  belongs_to :organization
end
