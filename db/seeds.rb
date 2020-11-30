require 'faker'
require "open-uri"

flight_classes = ["Economy", "Business", "First Class"]
airlines = ["Air France", "Luxair", "British Airways", "Iberia", "Delta", "Ryanair", "KLM"]

# Cleaning the DB
puts "Starting the seeding process!"
puts ""
puts "Clearing the DB"

FlightBooking.delete_all
UsersTrip.delete_all
Invitation.delete_all
Trip.delete_all

puts ""
puts "DB cleared"

# Definition of the method which creates the seeder account
def create_seeder
  seeder = User.create!(email: "seeder@gmail.com", password: "123456", first_name: "seeder", last_name: "McSeed", username: "seed_account", job_title: "CEO", company: "Seeds'r'us", host: true)
  seeder_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606737647/pexels-mohamed-abdelgaffar-771742_keiihs.jpg')
  seeder.photo.attach(io: seeder_file, filename: 'seeder.png', content_type: 'image/png')
  return seeder
end

# Definition of the method which creates the traveler account
def create_traveller(number)
  case number
  when 1
    traveler1 = User.create!(email: "traveler1@gmail.com", password: "123456", first_name: "John", last_name: "Doe", job_title: "CFO", company: "Seeds'r'us", username: "traveler 1")
    traveler1_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606737647/pexels-bruno-salvadori-2269872_bf8v3j.jpg')
    traveler1.photo.attach(io: traveler1_file, filename: 'traveler1.png', content_type: 'image/png')
    return traveler1
  when 2
    traveler2 = User.create!(email: "traveler2@gmail.com", password: "123456", first_name: "Marc", last_name: "Twain", job_title: "COO", company: "Seeds'r'us", username: "traveler 2")
    traveler2_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606737647/pexels-chloe-kala-1043471_diktq2.jpg')
    traveler2.photo.attach(io: traveler2_file, filename: 'traveler2.png', content_type: 'image/png')
    return traveler2
  when 3
    traveler3 = User.create!(email: "traveler3@gmail.com", password: "123456", first_name: "Owen", last_name: "Lars", job_title: "VP Sales", company: "Seeds'r'us", username: "traveler 3")
    traveler3_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606741658/pexels-pixabay-220453_r63im6.jpg')
    traveler3.photo.attach(io: traveler3_file, filename: 'traveler3.png', content_type: 'image/png')
    return traveler3
  when 4
    traveler4 = User.create!(email: "traveler4@gmail.com", password: "123456", first_name: "Robin", last_name: "Smudlers", job_title: "VP Marketing", company: "Seeds'r'us", username: "traveler 4")
    traveler4_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606741657/pexels-masha-raymers-2726111_ggmykm.jpg')
    traveler4.photo.attach(io: traveler4_file, filename: 'traveler4.png', content_type: 'image/png')
    return traveler4
  when 5
    traveler5 = User.create!(email: "traveler5@gmail.com", password: "123456", first_name: "Emma", last_name: "Rock", job_title: "VP Monetization", company: "Seeds'r'us", username: "traveler 5")
    traveler5_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606741657/pexels-pixabay-415829_nw2z47.jpg')
    traveler5.photo.attach(io: traveler5_file, filename: 'traveler5.png', content_type: 'image/png')
    return traveler5
  end 
end

# Check if seeder account exists and has a photo. Deletes it if bad. Creates it when deleted or if it doesn't exist.
if User.exists?(:username => "seed_account")
  if User.where(username: "seed_account").first.photo.attached?
    seeder = User.where(username: "seed_account").first
  else
    User.where(username: "seed_account").first.delete
    seeder = create_seeder
  end
else
  seeder = create_seeder
end

# Check if traveler accounts exist and have a photo. Deletes them if bad. Creates them when deleted or if they don't exist.
# Traveler 1
if User.exists?(:username => "traveler 1")
  if User.where(username: "traveler 1").first.photo.attached?
    traveler1 = User.where(username: "traveler 1").first
  else
    User.where(username: "traveler 1").first.delete
    traveler1 = create_traveller(1)
  end
else
  traveler1 = create_traveller(1)
end
# Traveler 2
if User.exists?(:username => "traveler 2")
  if User.where(username: "traveler 2").first.photo.attached?
    traveler2 = User.where(username: "traveler 2").first
  else
    User.where(username: "traveler 2").first.delete
    traveler2 = create_traveller(2)
  end
else
  traveler2 = create_traveller(2)
end
# Traveler 3
if User.exists?(:username => "traveler 3")
  if User.where(username: "traveler 3").first.photo.attached?
    traveler3 = User.where(username: "traveler 3").first
  else
    User.where(username: "traveler 3").first.delete
    traveler3 = create_traveller(3)
  end
else
  traveler3 = create_traveller(3)
end
# Traveler 4
if User.exists?(:username => "traveler 4")
  if User.where(username: "traveler 4").first.photo.attached?
    traveler4 = User.where(username: "traveler 4").first
  else
    User.where(username: "traveler 4").first.delete
    traveler4 = create_traveller(4)
  end
else
  traveler4 = create_traveller(4)
end
# Traveler 5
if User.exists?(:username => "traveler 5")
  if User.where(username: "traveler 5").first.photo.attached?
    traveler5 = User.where(username: "traveler 5").first
  else
    User.where(username: "traveler 5").first.delete
    traveler5 = create_traveller(5)
  end
else
  traveler5 = create_traveller(5)
end

# Passengers array contains all created travelers

passengers = [traveler1, traveler2, traveler3, traveler4, traveler5]

puts ""
puts "#{seeder.username} is ready to seed the DB!"
puts ""
puts "Travelers 1 to 5 are ready to party!"
puts ""
puts "Curently #{User.count} users in the DB"
puts ""
puts "Seeding new trips, please wait..."

# Creating 4 trips
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
    end_date: Time.now + rand(86400..168800),
    airport_code: ["BCN", "ZRH", "NCE", "DUB"].sample,
    description: "Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi? Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi?"
    )
    
  # Attaching a random picture to the trip
  file = URI.open('https://source.unsplash.com/1600x900/?trip')
  trip.photo.attach(io: file, filename: 'trip.png', content_type: 'image/png')
  trip.host = seeder
  trip.save

  # Selecting 2 unique users from the 5 passengers created
  user1 = passengers.sample
  user2 = passengers.sample
  until user1 != user2 do
    user2 = passengers.sample
  end

  # Assigning these 2 users to the trip
  trip.users << user1
  trip.users << user2

  # Generating a flightBooking for user1
  flight = FlightBooking.new(
    flight_number: "#{('A'..'Z').to_a.sample}#{('A'..'Z').to_a.sample}#{rand(1000..9999)}",
    departure_airport_code: ["CDG", "LHR", "GVA", "BOD"].sample,
    arrival_airport_code: trip.airport_code,
    airline: airlines.sample,
    price: rand(200..1000),
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - [7200, 10800, 14400, 18000].sample,
    arrival_date_local: trip.start_date - 3600
  )

  flight.trip = trip
  flight.user = user1
  flight.save

  # Generating a flightBooking for user2
  flight = FlightBooking.new(
    flight_number: "#{('A'..'Z').to_a.sample}#{('A'..'Z').to_a.sample}#{rand(1000..9999)}",
    departure_airport_code: ["CDG", "LHR", "GVA", "BOD"].sample,
    arrival_airport_code: trip.airport_code,
    airline: airlines.sample,
    price: rand(200..1000),
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - [7200, 10800, 14400, 18000].sample,
    arrival_date_local: trip.start_date - 3600
  )

  flight.trip = trip
  flight.user = user2
  flight.save
end

puts ""
puts "Seeding completed, #{seeder.username} was used to create #{Trip.count} trips!"
