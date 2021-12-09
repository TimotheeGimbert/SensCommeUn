class ExternalStakeholder < ApplicationRecord
  belongs_to :organization
  belongs_to :stakeholder_category
  belongs_to :user, optional: true
end
