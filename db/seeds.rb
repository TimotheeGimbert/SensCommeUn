# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
JoinMessagesRecipient.destroy_all
PrivateMessage.destroy_all
Activity.destroy_all
ExternalStakeholder.destroy_all
LegalRep.destroy_all
Organization.destroy_all
ActivitySector.destroy_all
Profile.destroy_all
City.destroy_all
User.destroy_all
Admin.destroy_all

puts "ALL ENTRIES IN THE DATABASE HAS BEEN DESTROYED"

admin = Admin.create(email: "admin@admin.com", password: "azerty")
puts admin
user = User.create(email: "user@user.com", password: "azerty")
puts user
legrep = User.create(email: "legalrep@legalrep.com", password: "azerty")
puts legrep

10.times do
  user = User.create(email: Faker::Internet.unique.email, password: Faker::Lorem.characters(number: 10))
  puts user
end

['Paris', 'Marseille', 'Bordeaux', 'Nice', 'Montréal'].each do |city| 
  city = City.create(name: city)
  puts city
end

User.all.each do |user|
  profile = Profile.create(user: user, city: City.all.sample(1).first, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "REGEX !!!")
  puts profile
end

10.times do 
  pm = PrivateMessage.create(object: Faker::Lorem.word , content: Faker::Lorem.paragraph(sentence_count: 2) , author: User.all.sample(1).first)
  puts pm
end

PrivateMessage.all.each do |message|
  1..4.times do
    jm = JoinMessagesRecipient.create(private_message: message, recipient:User.all.sample(1).first)
    puts jm
  end
   0..1.times do 
    jm = JoinMessagesRecipient.create(private_message: message, recipient:Admin.all.sample(1).first)
    puts jm
  end
end

statuses = ['Association','fondation','Société anonyme','Société à responsabilité limitée','Société par actions simplifiée','Non-déterminé']
statuses.each do |status|
  Status.create(name: status)
end 
puts "Statut créés"

activity_sectors = ['Action sociale, crèches, petite enfance','Agriculture, agro-alimentaire','Commerce, commerce équitable, réparation de véhicules','Construction, BTP et activités immobilières','Culture','Enseignement, formation','Environnement, développement durable','Hébergement, restauration','Industrie, sous-traitance industrielle','Production artisanale, textile','Recyclage des déchets','Services à la personne','Services aux entreprises','Non-déterminé']
activity_sectors.each do |activity_sectors|
  ActivitySector.create(name: activity_sectors)
end 
puts "Secteur d'activités créés"

30.times do 
  organization = Organization.create(
    name: Faker::Company.name, 
    nickname: Faker::Name.initials, 
    creation_date: Faker::Date.in_date_period, 
    address: Faker::Address.street_address, 
    address_complement: Faker::Address.secondary_address, 
    zip_code: Faker::Address.zip_code, 
    city: City.all.sample(1).first, 
    email: Faker::Internet.email, 
    phone_number: "06 25 47 13 09", 
    status: Status.all.sample(1).first, 
    siren: Faker::Company.french_siren_number, 
    description: Faker::Lorem.paragraph(sentence_count: 5), 
    activity_sector: ActivitySector.all.sample(1).first, 
    naf_ape: "a completer", 
    logo_url: Faker::Company.logo, 
    website_url: Faker::Internet.url
  )
  puts organization
end 
puts "30 organisations créées"

10.times do 
  activity = Activity.create(name: Faker::Company.type, description: Faker::Lorem.paragraph(sentence_count: 5), activity_sector: ActivitySector.all.sample(1).first, organization: Organization.all.sample(1).first)
  puts activity
end 
puts "10 activités créées"

['client','fournisseur','financeur'].each do |category|
  StakeholderCategory.create(name: category)
end
puts "categories de pp crees"

Organization.all.each do |organization|
  3..5.times do 
    stakeholder = ExternalStakeholder.create(name: Faker::Name.first_name, organization: organization, stakeholder_category: StakeholderCategory.all.sample(1).first, email: Faker::Internet.email, user: User.all.sample(1).first)
    puts stakeholder
  end
end
puts "Parties prenantes créées"

5.times do
  legrep = LegalRep.create(
    user: User.all.sample(1).first,
    organization: Organization.all.sample(1).first,
    start_date: Faker::Date.in_date_period,
    end_date: Faker::Date.in_date_period  
  )
  puts legrep
end
puts "Représentant légaux créés"

LegalRep.create(user: User.find_by(email: "user@user.com"), organization: Organization.first)
