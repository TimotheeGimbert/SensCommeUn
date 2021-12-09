class Organization < ApplicationRecord
  belongs_to :city
  belongs_to :status
  belongs_to :activity_sector
end
