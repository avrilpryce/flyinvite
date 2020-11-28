require 'faker'

flight_classes = ["Economy", "Business", "First Class"]
airlines = ["Air France", "Luxair", "British Airways", "Iberia", "Delta", "Ryanair", "KLM"]

puts "Starting the seeding process!"
puts ""
puts "Clearing the DB of #{Trip.count} trips"

FlightBooking.delete_all
UsersTrip.delete_all
Invitation.delete_all
Trip.delete_all

puts ""
puts "Trips cleared"

if User.exists?(:username => "seed_account")
  seeder = User.where(username: "seed_account").first
else
  seeder = User.create!(email: "seeder@gmail.com", password: "123456", first_name: "seeder", last_name: "McSeed", username: "seed_account", job_title: "CEO", company: "Seeds'r'us", host: true)
end

if User.exists?(:username => "traveler 1")
  traveler1 = User.where(username: "traveler 1").first
else
  traveler1 = User.create!(email: "traveler1@gmail.com", password: "123456", first_name: "John", last_name: "Doe", job_title: "CFO", company: "Seeds'r'us", username: "traveler 1")
end

if User.exists?(:username => "traveler 2")
  traveler2 = User.where(username: "traveler 2").first
else
  traveler2 = User.create!(email: "traveler2@gmail.com", password: "123456", first_name: "Marc", last_name: "Twain", job_title: "COO", company: "Seeds'r'us", username: "traveler 2")
end

passengers = [traveler1, traveler2]

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
  trip.users << traveler1
  trip.users << traveler2

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
