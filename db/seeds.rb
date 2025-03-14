# Suppression des anciennes données
User.destroy_all
Car.destroy_all
Rental.destroy_all

# Définition des localisations possibles
localisations = [
  "Paris, France", "Lyon, France", "Marseille, France", "Bordeaux, France",
  "Lille, France", "Toulouse, France", "Nantes, France", "Nice, France",
  "Strasbourg, France", "Montpellier, France", "Rennes, France", "Grenoble, France",
  "Maubeuge, Nord", "Roubaix, France", "Amiens, France", "Nancy, France",
  "Dunkerque, France", "Perpignan, France", "Metz, France"
]

# Création des utilisateurs
users = [
  { email: "jean.pascallaruch@gmail.com", password: "123soleil" },
  { email: "jean.pascaline.laruch@gmail.com", password: "123soleil" },
  { email: "george.laruch@gmail.com", password: "123soleil" },
  { email: "jean.marc.pascallaruch@gmail.com", password: "123soleil" },
  { email: "jean.pierre.laruch@gmail.com", password: "123soleil" },
  { email: "jeff.tuche@gmail.com", password: "123soleil" },
  { email: "jp.truffe@gmail.com", password: "123soleil" },
  { email: "denis.lamalice@gmail.com", password: "123soleil" },
  { email: "gwen.tuff@gmail.com", password: "123soleil" },
  { email: "medhi.benz@gmail.com", password: "123soleil" },
  { email: "marine.du93@gmail.com", password: "123soleil" },
  { email: "jeff.du59@gmail.com", password: "123soleil" },
  { email: "olivier.lasono@gmail.com", password: "123soleil" },
  { email: "olivier.debethune@gmail.com", password: "123soleil" },
  { email: "oliver.disco@gmail.com", password: "123soleil" },
  { email: "o.tuche@gmail.com", password: "123soleil" },
  { email: "jeanmi.puffe@gmail.com", password: "123soleil" },
  { email: "gpas.laref@gmail.com", password: "123soleil" },
  { email: "jeanpierre.puff@gmail.com", password: "123soleil" },
  { email: "jeandunord59@gmail.com", password: "123soleil" },
  { email: "fred.laruch@gmail.com", password: "123soleil" },
  { email: "fred.dunord@gmail.com", password: "123soleil" },
  { email: "fred.debethune@gmail.com", password: "123soleil" },
  { email: "leparking.fred@gmail.com", password: "123soleil" },
  { email: "leparking.jeff@gmail.com", password: "123soleil" },
  { email: "leparking.marine@gmail.com", password: "123soleil" },
  { email: "leparking.olivier@gmail.com", password: "123soleil" },
  { email: "yes.du59@gmail.com", password: "123soleil" },
  { email: "yes.du21@gmail.com", password: "123soleil" },
  { email: "dj.medhi@gmail.com", password: "123soleil" },
  { email: "marine.belgique@gmail.com", password: "123soleil" },
  { email: "vive.la.belgique@gmail.com", password: "123soleil" },
  { email: "olivier.lasono59@gmail.com", password: "123soleil" },
  { email: "olivier.debethune59@gmail.com", password: "123soleil" },
  { email: "oliver.disco56@gmail.com", password: "123soleil" },
  { email: "o.tuche89@gmail.com", password: "123soleil" },
  { email: "jeanmi.puffe58@gmail.com", password: "123soleil" },
  { email: "gpas.laref69@gmail.com", password: "123soleil" },
  { email: "jeanpierre.puff69@gmail.com", password: "123soleil" },
  { email: "jeandunord.du59@gmail.com", password: "123soleil" }
]

created_users = users.map do |user|
  User.find_or_create_by!(email: user[:email]) do |u|
    u.password = user[:password]
  end
end

# Création des voitures avec localisation aléatoire
cars = [
  { style: "stance", name: "Nissan 350Z", price: 90, year: 2018, description: "Voiture abaissée avec kit carrosserie et jantes larges.", public_id: "1" },
  { style: "neon", name: "BMW E46", price: 85, year: 2017, description: "Tuning agressif et carrossage négatif.", public_id: "2" },
  { style: "mini", name: "Mazda RX-8", price: 95, year: 2019, description: "Look sportif et suspension modifiée.", public_id: "3" },
  { style: "mini", name: "Toyota GT86", price: 100, year: 2020, description: "Idéale pour le drift et le show.", public_id: "4" },
  { style: "offroad", name: "Honda S2000", price: 88, year: 2016, description: "Un classique du stance avec un style unique.", public_id: "5" },
  { style: "neon", name: "Ford Mustang", price: 120, year: 2015, description: "Muscle car mythique avec un V8 puissant.", public_id: "6" },
  { style: "offroad", name: "Chevrolet Camaro", price: 130, year: 2016, description: "Camaro survitaminée pour les amateurs de vitesse.", public_id: "7" },
  { style: "muscle", name: "Dodge Challenger", price: 125, year: 2017, description: "Challenger avec un rugissement impressionnant.", public_id: "8" },
  { style: "mini", name: "Pontiac GTO", price: 135, year: 2018, description: "GTO avec un look rétro et agressif.", public_id: "9" },
  { style: "muscle", name: "Shelby GT500", price: 140, year: 2019, description: "GT500, la légende des muscle cars.", public_id: "10" },
  { style: "muscle", name: "Honda Civic", price: 80, year: 2020, description: "Civic équipée de néons multicolores et kit body.", public_id: "11" },
  { style: "muscle", name: "Toyota Supra", price: 85, year: 2019, description: "Supra avec un éclairage futuriste.", public_id: "12" },
  { style: "muscle", name: "Mitsubishi Eclipse", price: 75, year: 2021, description: "Eclipse, le symbole du tuning japonais.", public_id: "13" },
  { style: "muscle", name: "Volkswagen Golf", price: 100, year: 2016, description: "Golf boostée avec un système audio de compétition.", public_id: "14" },
  { style: "muscle", name: "Peugeot 206", price: 105, year: 2015, description: "206 avec subwoofers puissants.", public_id: "15" },
  { style: "neon", name: "Jeep Wrangler", price: 110, year: 2021, description: "Wrangler tout-terrain avec pneus renforcés.", public_id: "16" },
  { style: "offroad", name: "Toyota Land Cruiser", price: 115, year: 2020, description: "Land Cruiser prêt pour l'aventure extrême.", public_id: "17" },
  { style: "mini", name: "Fiat 500", price: 70, year: 2023, description: "500, petite mais pleine de charme.", public_id: "18" },
  { style: "mini", name: "Mini Cooper", price: 75, year: 2022, description: "Mini Cooper avec un design iconique.", public_id: "19" },
  { style: "sono", name: "Subaru BRZ", price: 95, year: 2021, description: "Une voiture élégante et parfaite pour le stance.", public_id: "20" },
  { style: "sono", name: "Lexus IS300", price: 88, year: 2019, description: "Une Lexus au look agressif et abaissée.", public_id: "21" },
  { style: "sono", name: "Dodge Charger", price: 140, year: 2022, description: "Une berline musclée avec un moteur puissant.", public_id: "22" },
  { style: "sono", name: "Chevrolet Corvette C7", price: 150, year: 2020, description: "Une Corvette iconique avec un rugissement unique.", public_id: "23" },
  { style: "stance", name: "Nissan Skyline R34", price: 110, year: 2018, description: "Skyline avec éclairage sous châssis et néons personnalisés.", public_id: "24" },
  { style: "stance", name: "Hyundai Veloster", price: 85, year: 2021, description: "Une compacte ultra-moderne avec néons LED.", public_id: "25" },
  { style: "stance", name: "Renault Clio", price: 90, year: 2017, description: "Une Clio avec un système audio de compétition.", public_id: "26" },
  { style: "stance", name: "Audi A3", price: 120, year: 2019, description: "Audi premium avec caissons de basses optimisés.", public_id: "27" },
  { style: "muscle", name: "Ford Bronco", price: 125, year: 2023, description: "Un tout-terrain robuste pour les aventuriers.", public_id: "28" },
  { style: "neon", name: "Mercedes G-Wagon", price: 180, year: 2022, description: "Un SUV de luxe, puissant et tout-terrain.", public_id: "29" },
  { style: "neon", name: "Honda e", price: 75, year: 2021, description: "Une citadine électrique au look rétro-futuriste.", public_id: "30" },
  { style: "mini", name: "Smart Fortwo", price: 60, year: 2023, description: "La voiture parfaite pour la ville, ultra-compacte.", public_id: "31" }
]

# Assignation des voitures aux utilisateurs
cars.each do |car_data|
  user = created_users.sample
  location = localisations.sample # Attribution aléatoire d'une localisation

  new_car = Car.new(car_data.merge(user: user, location: location))

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
