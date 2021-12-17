class Profile < ApplicationRecord
  validate :format_phone_number 

  belongs_to :user
  belongs_to :city

end
