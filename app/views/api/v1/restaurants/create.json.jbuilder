json.restaurant do
  json.id @restaurant.id
  json.rating @restaurant.rating
  json.name @restaurant.name
  json.site @restaurant.site
  json.email @restaurant.email
  json.phone @restaurant.phone
  json.street @restaurant.street
  json.city @restaurant.city
  json.state @restaurant.state
  json.latitude @restaurant.lat
  json.longitude @restaurant.lng
end
