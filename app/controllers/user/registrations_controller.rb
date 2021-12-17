class User::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create 
    super do |resource|
      Profile.create(user: resource, city: City.first, phone_number:"0600000000" )
    end 
  end

end
