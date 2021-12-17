class User::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create 
    super do |resource|
      puts "$T$" * 100
      puts resource

      undefined = "undefined"
      undefined_city = City.create(name: undefined)
      Profile.new
      prof = Profile.create(user: resource, city: undefined_city, first_name: undefined, last_name: undefined, phone_number: undefined)
      puts prof
    end 
  end

end
