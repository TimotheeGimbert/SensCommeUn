class ActivitySector < ApplicationRecord
  validates :name, presence: true

  has_many :organizations
  has_many :activities, through: :organizations
end
