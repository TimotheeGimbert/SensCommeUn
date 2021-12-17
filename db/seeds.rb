# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
PrivateMessage.destroy_all
Activity.destroy_all
ExternalStakeholder.destroy_all
StakeholderCategory.destroy_all
LegalRep.destroy_all
Organization.destroy_all
ActivitySector.destroy_all
Profile.destroy_all
City.destroy_all
User.destroy_all
Admin.destroy_all

puts "ALL ENTRIES IN THE DATABASE HAS BEEN DESTROYED"

10.times do
  user = User.create(confirmation_token: "test", confirmed_at: DateTime.now, email: Faker::Internet.unique.email, password: Faker::Lorem.characters(number: 10))
  puts user
end

['non déterminée','Paris', 'Marseille', 'Bordeaux', 'Nice', 'Montréal'].each do |city| 
  city = City.create(name: city)
  puts city
end

User.all.each do |user|
  profile = Profile.create( user: user, city: City.all.sample(1).first, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "00#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)}")
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

statuses = ['Association','Fondation','Société anonyme','Société à responsabilité limitée','Société par actions simplifiée','Non-déterminé']
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
    zip_code: "00000", 
    city: City.all.sample(1).first, 
    email: Faker::Internet.email, 
    phone_number: "06 25 47 13 09", 
    status: Status.all.sample(1).first, 
    siren: Faker::Company.french_siren_number, 
    description: Faker::Lorem.paragraph(sentence_count: 5), 
    activity_sector: ActivitySector.all.sample(1).first, 
    naf_ape: ["AZED5","AHUI8","MLOP5","KILI2","AOLI8","BFSI3"].sample(1).first ,
    logo_url: Faker::Company.logo, 
    website_url: "https://motherfuckingwebsite.com/"
  )
  puts organization
end 


10.times do 
  activity = Activity.create(
    name: Faker::Company.type, 
    description: Faker::Lorem.paragraph(sentence_count: 5), 
    activity_sector: ActivitySector.all.sample(1).first, 
    organization: Organization.all.sample(1).first
  )
  puts activity
end 
puts "10 activités créées"

['non déterminé','client','fournisseur','financeur'].each do |category|
  StakeholderCategory.create(name: category)
end
puts "categories de pp crees"

Organization.all.each do |organization|
  3..5.times do 
    stakeholder = ExternalStakeholder.create(
      name: Faker::Name.first_name, 
      organization: organization, 
      stakeholder_category: StakeholderCategory.all.sample(1).first, 
      email: Faker::Internet.email, 
      user: User.all.sample(1).first)
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



###############################################
# Seeds dedicated to application tests and demo dashboard
###############################################

basic_user = User.create(email: "user@user.com", password: "azerty",confirmation_token: "test", confirmed_at: DateTime.now)
  puts basic_user
  profile = Profile.create(user: basic_user, city: City.all.sample(1).first, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0139402356")
  puts profile

legrep_user = User.create(email: "legalrep@legalrep.com", password: "azerty" ,confirmation_token: "test", confirmed_at: DateTime.now)
  puts legrep_user
  profile = Profile.create(user: legrep_user, city: City.all.sample(1).first, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0739402356")
  puts profile

admin = Admin.create(email: "admin@admin.com", password: "azerty")
  puts admin

sens_commun = Organization.create(
  name: "SENS·COMMUN", 
  nickname: "sensC", 
  creation_date: DateTime.new(2021,12,11,23,11,0), 
  address: Faker::Address.street_address, 
  address_complement: Faker::Address.secondary_address, 
  zip_code: "75010", 
  city: City.all.sample(1).first, 
  email: "sens@sens.com", 
  phone_number: "01 11 11 11 11", 
  status: Status.all.sample(1).first, 
  siren: Faker::Company.french_siren_number, 
  description: "This company instance is serving a demonstration purpose, in order to test our app manually", 
  activity_sector: ActivitySector.all.sample(1).first, 
  naf_ape: "AAAA4", 
  logo_url: Faker::Company.logo, 
  website_url: "https://sens-commun.herokuapp.com/"
)
puts sens_commun

user_stakeholder = ExternalStakeholder.create(
  name: "USER-Basic-PP", 
  organization: sens_commun, 
  stakeholder_category: StakeholderCategory.last, 
  email: "sensbasic@sens.com", 
  user: basic_user
)
puts user_stakeholder

legrep_stakeholder = ExternalStakeholder.create(
  name: "USER-LegRep-PP", 
  organization: Organization.all.sample(1).first, 
  stakeholder_category: StakeholderCategory.all.sample(1).first, 
  email: "sensLegRep@sens.com", 
  user: legrep_user
)
puts user_stakeholder

legalrep = LegalRep.create(
  user: User.find_by(email: "legalrep@legalrep.com"), 
  organization: sens_commun
)
puts legalrep

legalrep = LegalRep.create(
  user: User.find_by(email: "legalrep@legalrep.com"), 
  organization: Organization.first
)
puts legalrep

3.times do 
  pm = PrivateMessage.create(object: Faker::Lorem.word , content: Faker::Lorem.paragraph(sentence_count: 2) , author: basic_user)
  puts pm
  1..4.times do
    jm = JoinMessagesRecipient.create(private_message: pm, recipient:User.all.sample(1).first)
    puts jm
  end
  pm = PrivateMessage.create(object: Faker::Lorem.word , content: Faker::Lorem.paragraph(sentence_count: 2) , author: legrep_user)
  puts pm
  1..4.times do
    jm = JoinMessagesRecipient.create(private_message: pm, recipient:User.all.sample(1).first)
    puts jm
  end
  pm = PrivateMessage.create(object: Faker::Lorem.word , content: Faker::Lorem.paragraph(sentence_count: 2) , author: admin)
  puts pm
  1..4.times do
    jm = JoinMessagesRecipient.create(private_message: pm, recipient:User.all.sample(1).first)
    puts jm
  end
end
