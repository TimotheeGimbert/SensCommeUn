class ActivitySector < ApplicationRecord
  has_many :organizations
  has_many :activities, through: :organizations
end
