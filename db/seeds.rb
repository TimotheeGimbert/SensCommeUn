# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


Profile.destroy_all
City.destroy_all
User.destroy_all
Admin.destroy_all
ActivitySector.destroy_all
Activity.destroy_all
ExternalStakeholder.destroy_all
Organization.destroy_all


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

['non déterminé','Association','fondation','Société anonyme','Société à responsabilité limitée','Société par actions simplifiée'].each do |status|
  Status.create(name: status)
end 
puts "statut créés"

['non déterminé','Action sociale, crèches, petite enfance','Agriculture, agro-alimentaire','Commerce, commerce équitable, réparation de véhicules','Construction, BTP et activités immobilières','Culture','Enseignement, formation','Environnement, développement durable','Hébergement, restauration','Industrie, sous-traitance industrielle','Production artisanale, textile','Recyclage des déchets','Services à la personne','Services aux entreprises'].each do |activity_sectors|
  ActivitySector.create(name: activity_sectors)
end 
puts "Secteur d'activités créés"


10.times do 
  orga= Organization.create(
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
    website_url: Faker::Internet.url)
  puts orga
end 
puts "10 organisations créés"

10.times do 
  Activity.create(name: Faker::Company.type, description: Faker::Lorem.paragraph(sentence_count: 5), activity_sector: ActivitySector.all.sample(1).first, organization: Organization.all.sample(1).first)
end 
puts "10 activités créés"

['client','fournisseur','financeur'].each do |category|
  StakeholderCategory.create(name: category)
end
puts "categories de pp crees"

Organization.all.each do |organization|
  3..5.times do 
    ExternalStakeholder.create(name: Faker::Name.first_name, organization: organization, stakeholder_category: StakeholderCategory.all.sample(1).first, email: Faker::Internet.email)
  end
end
puts "Organizations crees"