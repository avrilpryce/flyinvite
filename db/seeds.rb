require 'faker'

flight_classes = ["Economy", "Business", "First"]
airlines = ["Air France", "Luxair", "British Airways", "Iberia", "Delta", "Ryanair", "KLM"]

puts "Starting the seeding process!"
puts ""
puts "Clearing the DB of #{Trip.count} trips"

FlightBooking.delete_all
UsersTrip.delete_all
Trip.delete_all

puts ""
puts "Trips cleared"

if User.exists?(:username => "seed_account")
  seeder = User.where(username: "seed_account").first
else
  seeder = User.create!(email: "seeder@gmail.com", password: "123456", first_name: "seeder", last_name: "McSeed", username: "seed_account", job_title: "CEO", company: "Seeds'r'us", host: true)
end

if User.exists?(:username => "traveller 1")
  traveller1 = User.where(username: "traveller 1").first
else
  traveller1 = User.create!(email: "traveller1@gmail.com", password: "123456", first_name: "John", last_name: "T1", job_title: "CFO", company: "Seeds'r'us", username: "traveller 1")
end

if User.exists?(:username => "traveller 2")
  traveller2 = User.where(username: "traveller 2").first
else
  traveller2 = User.create!(email: "traveller2@gmail.com", password: "123456", first_name: "Marc", last_name: "T2", job_title: "COO", company: "Seeds'r'us", username: "traveller 2")
end

passengers = [traveller1, traveller2]

puts ""
puts "#{seeder.username} is ready to seed the DB!"
puts "Curently #{User.count} users in the DB"
puts ""
puts "Seeding new trips, please wait..."

4.times do 
  trip = Trip.new(
    name: Faker::Address.community,
    street: Faker::Address.street_name,
    zip: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    max_price: (rand(1000..10000)),
    flight_class: flight_classes.sample,
    start_date: Time.now - 86400,
    end_date: Time.now + rand(86400..168800)
  )

  trip.host = seeder
  trip.save
  trip.users << traveller1
  trip.users << traveller2

  2.times do

    flight = FlightBooking.new(
      flight_number: "#{('A'..'Z').to_a.sample}#{('A'..'Z').to_a.sample}#{rand(1000..9999)}",
      departure_airport_code: ["CDG", "LHR", "GVA", "BOD"].sample,
      arrival_airport_code: ["BCN", "ZRH", "NCE", "DUB"].sample,
      airline: airlines.sample,
      price: rand(200..1000),
      flight_class: flight_classes.sample,
      departure_date_local: Time.now,
      arrival_date_local: Time.now + rand(3600..7200)
    )

    flight.trip = trip
    flight.user = passengers.sample
    flight.save
  end
end

puts ""
puts "Seeding completed, #{seeder.username} was used to create #{Trip.count} trips!"
