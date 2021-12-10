require 'date'
puts "🌱 Seeding spices..."



(0..5).each do |num|
  puts "creating_trip #{num}"
  trip1 = Trip.create(from: Faker::Address.city, to: Faker::Address.city, depart_date: Date.today, budget: 16)

  (0..5).each do |num2|
    puts "creating_stops #{num2}"
    stop = trip1.stops.create(stop_reason: "Gas", note: Faker::Movies::StarWars.quote)
    stop.create_cost(amount: Faker::Number.number(digits: 3), trip: trip1)
  end

  (0..5).each do |num3|
    puts "creating_hotels #{num3}" 
    hotel = trip1.hotels.create(check_in: Date.today, check_out: Date.tomorrow, location: Faker::Address.city)
    hotel.create_cost(amount: Faker::Number.number(digits: 3), trip: trip1)
  end

  (0..5).each do |num4|
    puts "creating_provider #{num4}"
    provider = trip1.providers.create(date: Date.tomorrow, note: Faker::Movies::StarWars.quote, name: Faker::Company.name)
    provider.create_cost(amount: Faker::Number.number(digits: 3), trip: trip1) 
  end

  
end

puts "✅ Done seeding!"
