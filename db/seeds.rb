require 'faker'

flight_classes = ["Economy", "Business", "First"]

puts "Starting the seeding process!"
puts ""
puts "Clearing the DB of #{Trip.count} trips"
UsersTrip.delete_all
Trip.delete_all
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
    flight_class: flight_classes.sample
  )
  trip.host = seeder
  trip.save
  trip.users << traveller1
  trip.users << traveller2
end

puts "Seeding completed, #{seeder.username} was used to create #{Trip.count} trips!"


# FlightBooking.create(
#   flight_number: "RA2450", 
#   price: rand(200..1000),
#   flight_class: classes.sample
#   departure_date_local:
#   arrival_date_local:
#   departure_date_UTC:
#   arrival_date_UTC:
# )