# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Car.destroy_all
User.destroy_all

users=[
  {email: "JeanPascallaruch@gmail.com", password: "123soleil" },
  {email: "JeanPascalinelaruch@gmail.com", password: "123soleil" },
  {email: "GeorgePascallaruch@gmail.com", password: "123soleil" },
  {email: "JeanmarcPascallaruch@gmail.com", password: "123soleil" },
  {email: "JeanpierrePascallaruch@gmail.com", password: "123soleil" }
]

users.each do |user|
  User.create!(user)
end

cars=[
  { user: User.all.sample, style: "stance", name: "Nissan 350Z", price: 90, year: 2018, description: "Voiture abaissée avec kit carrosserie et jantes larges." },
  { user: User.all.sample, style: "stance", name: "BMW E46", price: 85, year: 2017, description: "Tuning agressif et carrossage négatif." },
  { user: User.all.sample, style: "stance", name: "Mazda RX-8", price: 95, year: 2019, description: "Look sportif et suspension modifiée." },
  { user: User.all.sample, style: "stance", name: "Toyota GT86", price: 100, year: 2020, description: "Idéale pour le drift et le show." },
  { user: User.all.sample, style: "stance", name: "Honda S2000", price: 88, year: 2016, description: "Un classique du stance avec un style unique." },
  { user: User.all.sample, style: "muscle", name: "Ford Mustang", price: 120, year: 2015, description: "Muscle car mythique avec un V8 puissant." },
  { user: User.all.sample, style: "muscle", name: "Chevrolet Camaro", price: 130, year: 2016, description: "Camaro survitaminée pour les amateurs de vitesse." },
  { user: User.all.sample, style: "muscle", name: "Dodge Challenger", price: 125, year: 2017, description: "Challenger avec un rugissement impressionnant." },
  { user: User.all.sample, style: "muscle", name: "Pontiac GTO", price: 135, year: 2018, description: "GTO avec un look rétro et agressif." },
  { user: User.all.sample, style: "muscle", name: "Shelby GT500", price: 140, year: 2019, description: "GT500, la légende des muscle cars." },
  { user: User.all.sample, style: "neon", name: "Honda Civic Neon", price: 80, year: 2020, description: "Civic équipée de néons multicolores et kit body." },
  { user: User.all.sample, style: "neon", name: "Toyota Supra Neon", price: 85, year: 2019, description: "Supra avec un éclairage futuriste." },
  { user: User.all.sample, style: "neon", name: "Mitsubishi Eclipse", price: 75, year: 2021, description: "Eclipse, le symbole du tuning japonais." },
  { user: User.all.sample, style: "neon", name: "Nissan Silvia", price: 90, year: 2018, description: "Silvia avec des LED sous châssis." },
  { user: User.all.sample, style: "neon", name: "Mazda MX-5 Neon", price: 82, year: 2017, description: "MX-5 avec une personnalisation néon flashy." },
  { user: User.all.sample, style: "sono", name: "Volkswagen Golf Sono", price: 100, year: 2016, description: "Golf boostée avec un système audio de compétition." },
  { user: User.all.sample, style: "sono", name: "Peugeot 206 Sono", price: 105, year: 2015, description: "206 avec subwoofers puissants." },
  { user: User.all.sample, style: "sono", name: "Renault Clio Sono", price: 98, year: 2019, description: "Clio avec un caisson de basse impressionnant." },
  { user: User.all.sample, style: "sono", name: "Seat Ibiza Sono", price: 110, year: 2020, description: "Ibiza avec installation sono premium." },
  { user: User.all.sample, style: "sono", name: "Fiat Punto Sono", price: 102, year: 2018, description: "Punto Sono avec des basses ultra puissantes." },
  { user: User.all.sample, style: "offroad", name: "Jeep Wrangler", price: 110, year: 2021, description: "Wrangler tout-terrain avec pneus renforcés." },
  { user: User.all.sample, style: "offroad", name: "Toyota Land Cruiser", price: 115, year: 2020, description: "Land Cruiser prêt pour l'aventure extrême." },
  { user: User.all.sample, style: "offroad", name: "Ford Bronco", price: 120, year: 2019, description: "Bronco avec suspension surélevée." },
  { user: User.all.sample, style: "offroad", name: "Suzuki Jimny", price: 108, year: 2022, description: "Jimny agile pour les chemins difficiles." },
  { user: User.all.sample, style: "offroad", name: "Nissan Patrol", price: 125, year: 2018, description: "Patrol conçu pour l'exploration hors-piste." },
  { user: User.all.sample, style: "mini", name: "Fiat 500", price: 70, year: 2023, description: "500, petite mais pleine de charme." },
  { user: User.all.sample, style: "mini", name: "Mini Cooper", price: 75, year: 2022, description: "Mini Cooper avec un design iconique." },
  { user: User.all.sample, style: "mini", name: "Honda e", price: 72, year: 2021, description: "Honda e, citadine électrique au look rétro." },
  { user: User.all.sample, style: "mini", name: "Volkswagen Up!", price: 68, year: 2020, description: "Volkswagen Up!, compacte et économique." },
  { user: User.all.sample, style: "mini", name: "Smart Fortwo", price: 65, year: 2019, description: "Smart Fortwo, pratique pour les grandes villes." }
]

cars.each do |car|
  Car.create!(car)
end

puts "#{cars.count} cars has succesfully been uploaded"
