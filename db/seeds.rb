# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


User.destroy_all
Admin.destroy_all
City.destroy_all
Profile.destroy_all


Admin.create(email: "admin@admin.com", password: "azerty")
User.create(email: "user@user.com", password: "azerty")

10.times do
  User.create(email: Faker::Internet.unique.email, password: Faker::Lorem.characters(number: 10))
end

['Paris', 'Marseille','Bordeaux', 'Nice' ,'Montréal'].each do |city| 
  City.create(name: city)
end

User.all.each do |user|
  Profile.create(user: user, city: City.all.sample(1).first, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "REGEX !!!")
end