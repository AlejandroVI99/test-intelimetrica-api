require 'csv'

file = 'db/scripts/restaurantes.csv'

CSV.foreach(file, headers: true) do |restaurant|
  next if Restaurant.where(name: restaurant['name'])
  restaurant = Restaurant.create(
    rating: restaurant['rating'].to_i,
    name: restaurant['name'],
    site: restaurant['site'],
    email: restaurant['email'],
    phone: restaurant['phone'],
    street: restaurant['street'],
    city: restaurant['city'],
    state: restaurant['state'],
    lat: restaurant['lat'].to_f,
    lng: restaurant['lng'].to_f
  )
  puts restaurant.name
end
