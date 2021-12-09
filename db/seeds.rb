# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

JoinMessagesRecipient.destroy_all
PrivateMessage.destroy_all
Profile.destroy_all
City.destroy_all
User.destroy_all
Admin.destroy_all




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

10.times do 
  PrivateMessage.create(object: Faker::Lorem.word , content: Faker::Lorem.paragraph(sentence_count: 2) , author: User.all.sample(1).first)
end

PrivateMessage.all.each do |message|
  1..4.times do
    JoinMessagesRecipient.create(private_message: message, recipient:User.all.sample(1).first)
  end
   0..1.times do 
    JoinMessagesRecipient.create(private_message: message, recipient:Admin.all.sample(1).first)
  end
end