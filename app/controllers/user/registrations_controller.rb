class User::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create 
    super do |resource|
      Profile.create(user: resource, city: City.first )
    end 
  end

end
