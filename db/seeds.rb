require 'date'
puts "🌱 Seeding spices..."

# Seed your database here
puts "creating_trips"
trip1 = Trip.create(from:"Reno", to:"Orlando", depart_date: Date.today, budget: 16)

puts "creating_stops"
stop1 = trip1.stops.create(stop_reason:"Gas", note:"Hello Florida")
stop1.create_cost(amount: 100, trip: trip1)

puts "creating_hotels"
hotel = trip1.hotels.create(check_in: Date.today, check_out: Date.tomorrow, location: "tampa")
hotel.create_cost(amount: 100, trip: trip1)

puts "creating_provider"
provider = trip1.providers.create(date: Date.tomorrow, note: "movers to drop off boxes", name: "Victor Moving")
provider.create_cost(amount: 100, trip: trip1)

puts "✅ Done seeding!"
