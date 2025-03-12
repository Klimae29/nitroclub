User.destroy_all
Car.destroy_all

users = [
  { email: "JeanPascallaruch@gmail.com", password: "123soleil" },
  { email: "JeanPascalinelaruch@gmail.com", password: "123soleil" },
  { email: "GeorgePascallaruch@gmail.com", password: "123soleil" },
  { email: "JeanmarcPascallaruch@gmail.com", password: "123soleil" },
  { email: "JeanpierrePascallaruch@gmail.com", password: "123soleil" }
]

created_users = users.map { |user| User.find_or_create_by!(email: user[:email]) { |u| u.password = user[:password] } }

cars = [
  { style: "stance", name: "Nissan 350Z", price: 90, year: 2018, description: "Voiture abaissée avec kit carrosserie et jantes larges.", public_id: "1" },
  { style: "stance", name: "BMW E46", price: 85, year: 2017, description: "Tuning agressif et carrossage négatif.", public_id: "2" },
  { style: "stance", name: "Mazda RX-8", price: 95, year: 2019, description: "Look sportif et suspension modifiée.", public_id: "3" },
  { style: "stance", name: "Toyota GT86", price: 100, year: 2020, description: "Idéale pour le drift et le show.", public_id: "4" },
  { style: "stance", name: "Honda S2000", price: 88, year: 2016, description: "Un classique du stance avec un style unique.", public_id: "5" },
  { style: "muscle", name: "Ford Mustang", price: 120, year: 2015, description: "Muscle car mythique avec un V8 puissant.", public_id: "6" },
  { style: "muscle", name: "Chevrolet Camaro", price: 130, year: 2016, description: "Camaro survitaminée pour les amateurs de vitesse.", public_id: "7" },
  { style: "muscle", name: "Dodge Challenger", price: 125, year: 2017, description: "Challenger avec un rugissement impressionnant.", public_id: "8" },
  { style: "muscle", name: "Pontiac GTO", price: 135, year: 2018, description: "GTO avec un look rétro et agressif.", public_id: "9" },
  { style: "muscle", name: "Shelby GT500", price: 140, year: 2019, description: "GT500, la légende des muscle cars.", public_id: "10" },
  { style: "neon", name: "Honda Civic Neon", price: 80, year: 2020, description: "Civic équipée de néons multicolores et kit body.", public_id: "11" },
  { style: "neon", name: "Toyota Supra Neon", price: 85, year: 2019, description: "Supra avec un éclairage futuriste.", public_id: "12" },
  { style: "neon", name: "Mitsubishi Eclipse", price: 75, year: 2021, description: "Eclipse, le symbole du tuning japonais.", public_id: "13" },
  { style: "sono", name: "Volkswagen Golf Sono", price: 100, year: 2016, description: "Golf boostée avec un système audio de compétition.", public_id: "14" },
  { style: "sono", name: "Peugeot 206 Sono", price: 105, year: 2015, description: "206 avec subwoofers puissants.", public_id: "15" },
  { style: "offroad", name: "Jeep Wrangler", price: 110, year: 2021, description: "Wrangler tout-terrain avec pneus renforcés.", public_id: "16" },
  { style: "offroad", name: "Toyota Land Cruiser", price: 115, year: 2020, description: "Land Cruiser prêt pour l'aventure extrême.", public_id: "17" },
  { style: "mini", name: "Fiat 500", price: 70, year: 2023, description: "500, petite mais pleine de charme.", public_id: "18" },
  { style: "mini", name: "Mini Cooper", price: 75, year: 2022, description: "Mini Cooper avec un design iconique.", public_id: "19" }
]

cars.each do |car_data|
  user = created_users.sample
  new_car = Car.new(car_data.merge(user: user))

  if new_car.valid?
    new_car.save!
  else
    puts "⚠️ Erreur : Impossible d'ajouter la voiture #{car_data[:name]} → #{new_car.errors.full_messages.join(", ")}"
  end
end

# Affichage du résultat final
puts "✅ #{User.count} utilisateurs créés."
puts "✅ #{Car.count} voitures créées."

if Car.count < cars.size
  puts "⚠️ Certaines voitures n'ont pas été enregistrées."
end
