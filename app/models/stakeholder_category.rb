class StakeholderCategory < ApplicationRecord
  validates :name, presence: true
  
  has_many :external_stakeholders
end
