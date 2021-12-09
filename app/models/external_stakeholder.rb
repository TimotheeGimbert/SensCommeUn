class ExternalStakeholder < ApplicationRecord
  belongs_to :organization
  belongs_to :stakeholder_category
end
