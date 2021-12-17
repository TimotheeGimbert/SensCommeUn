class Activity < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, length: {maximum: 40}


  belongs_to :activity_sector
  belongs_to :organization
end
