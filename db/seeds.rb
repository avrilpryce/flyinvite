require 'faker'
require "open-uri"
require 'date'

flight_classes = ["Economy", "Prenium Economy", "Business", "First Class"]
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
puts "Seeder is done, creating Avril's demo trips"
puts "please wait..."

# Demo seed
# Create Avril's demo account
def create_avril
  avril = User.create!(email: "avril@gmail.com", password: "123456", first_name: "Avril", last_name: "Pryce", username: "Fab_Avril", job_title: "CEO", company: "Clubs'r'us", host: true)
  avril_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606922833/Profile_Pic_bk8gpv.png')
  avril.photo.attach(io: avril_file, filename: 'avril.png', content_type: 'image/png')
  return avril
end

# Create demo's traveler
def create_michelle
  michelle = User.create!(email: "m.williams@gmail.com", password: "123456", first_name: "Michelle", last_name: "Williams", username: "Destiny_Michelle", job_title: "Singer", company: "Destiny's Child")
  michelle_file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606923235/michelle_williams_headshot_crop_2_swjqjw.jpg')
  michelle.photo.attach(io: michelle_file, filename: 'michelle.png', content_type: 'image/png')
  return michelle
end

# Check if Avril and Michelle exist and have a photo. Deletes them if bad. Creates them when deleted or if they don't exist.
if User.exists?(:username => "Fab_Avril")
  if User.where(username: "Fab_Avril").first.photo.attached?
    avril = User.where(username: "Fab_Avril").first
  else
    User.where(username: "Fab_Avril").first.delete
    avril = create_avril
  end
else
  avril = create_avril
end

if User.exists?(:username => "Destiny_Michelle")
  if User.where(username: "Destiny_Michelle").first.photo.attached?
    michelle = User.where(username: "Destiny_Michelle").first
  else
    User.where(username: "Destiny_Michelle").first.delete
    michelle = create_michelle
  end
else
  michelle = create_michelle
end

# Methods to create demo trips
def create_la_tech(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
  trip = Trip.new(
    name: "Tech Conference",
    street: "N Heliotrope Dr",
    zip: "CA 90029",
    city: "Los Angeles",
    country: "United States",
    max_price: 600,
    flight_class: "Economy",
    start_date: DateTime.new(2020, 12, 11, 11, 00, 00),
    end_date: DateTime.new(2020, 12, 15, 18, 00, 00),
    airport_code: "LAX",
    description: "Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi? Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi?"
  )
    
  # Attaching a picture to the trip
  file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606924144/los-angeles_main_1440x800_h9vupz.jpg')
  trip.photo.attach(io: file, filename: 'trip.png', content_type: 'image/png')
  trip.host = avril
  trip.save

  # Selecting passengers
  user1 = traveler1
  user2 = traveler2
  user3 = traveler3

  # Assigning these users to the trip
  trip.users << user1
  trip.users << user2
  trip.users << user3

  # Generating a flightBooking for user1
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "JFK",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: rand(300..600),
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 7),
    arrival_date_local: trip.start_date - 3600
  )
  flight.trip = trip
  flight.user = user1
  flight.save

  # Generating a flightBooking for user2
  flight = FlightBooking.new(
    flight_number: "BA#{rand(1000..9999)}",
    departure_airport_code: "LHR",
    arrival_airport_code: trip.airport_code,
    airline: "British",
    price: 595,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 15),
    arrival_date_local: trip.start_date - (3600 * 2)
  )
  flight.trip = trip
  flight.user = user2
  flight.save

  # Generating a flightBooking for user3
  flight = FlightBooking.new(
    flight_number: "JB#{rand(1000..9999)}",
    departure_airport_code: "LAS",
    arrival_airport_code: trip.airport_code,
    airline: "Jet Blue",
    price: 325,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 4),
    arrival_date_local: trip.start_date - 3600
  )
  flight.trip = trip
  flight.user = user3
  flight.save

  puts ""
  puts "#{trip.name} created"
end

def create_ny_music(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
  trip = Trip.new(
    name: "Pop Concert",
    street: "11th Avenue",
    zip: "NY 43679",
    city: "New York",
    country: "United States",
    max_price: 500,
    flight_class: "Economy",
    start_date: DateTime.new(2020, 12, 18, 16, 00, 00),
    end_date: DateTime.new(2020, 12, 21, 19, 00, 00),
    airport_code: "JFK",
    description: "Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi? Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi?"
  )
    
  # Attaching a picture to the trip
  file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606924143/new-york-city-skyline-CHEAPNYCFLIGHT1017_opicdr.jpg')
  trip.photo.attach(io: file, filename: 'trip.png', content_type: 'image/png')
  trip.host = avril
  trip.save

  # Selecting passengers
  user1 = traveler4
  user2 = traveler5
  user3 = traveler3

  # Assigning these users to the trip
  trip.users << user1
  trip.users << user2
  trip.users << user3

  # Generating a flightBooking for user1
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "ATL",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: rand(300..450),
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 7),
    arrival_date_local: trip.start_date - 3600
  )
  flight.trip = trip
  flight.user = user1
  flight.save

  # Generating a flightBooking for user2
  flight = FlightBooking.new(
    flight_number: "AC#{rand(1000..9999)}",
    departure_airport_code: "YUL",
    arrival_airport_code: trip.airport_code,
    airline: "Air Canada",
    price: 467,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 6),
    arrival_date_local: trip.start_date - (3600 * 1)
  )
  flight.trip = trip
  flight.user = user2
  flight.save

  # Generating a flightBooking for user3
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "MIA",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: 398,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 4),
    arrival_date_local: trip.start_date - 3600
  )
  flight.trip = trip
  flight.user = user3
  flight.save

  puts ""
  puts "#{trip.name} created"
end

def create_lv_bday(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
  trip = Trip.new(
    name: "Vegas Birthday",
    street: "Las Vegas Bd.",
    zip: "NV 67934",
    city: "Las Vegas",
    country: "United States",
    max_price: 1500,
    flight_class: "Business",
    start_date: DateTime.new(2020, 12, 26, 16, 00, 00),
    end_date: DateTime.new(2020, 12, 28, 19, 00, 00),
    airport_code: "LAS",
    description: "Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi? Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi?"
  )
    
  # Attaching a picture to the trip
  file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606731978/35cy0djk12vrit0zp17tbgafvl9v.jpg')
  trip.photo.attach(io: file, filename: 'trip.png', content_type: 'image/png')
  trip.host = avril
  trip.save

  # Selecting passengers
  user1 = traveler4
  user2 = traveler5
  user3 = michelle

  # Assigning these users to the trip
  trip.users << user1
  trip.users << user2
  trip.users << user3

  # Generating a flightBooking for user1
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "MIA",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: 1340,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 10),
    arrival_date_local: trip.start_date - (3600 * 2)
  )
  flight.trip = trip
  flight.user = user1
  flight.save

  # Generating a flightBooking for user2
  flight = FlightBooking.new(
    flight_number: "JB#{rand(1000..9999)}",
    departure_airport_code: "LAX",
    arrival_airport_code: trip.airport_code,
    airline: "Jet Blue",
    price: 930,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 5),
    arrival_date_local: trip.start_date - (3600 * 2)
  )
  flight.trip = trip
  flight.user = user2
  flight.save

  # Generating a flightBooking for user3
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "JFK",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: 1420,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 11),
    arrival_date_local: trip.start_date - (3600 * 3)
  )
  flight.trip = trip
  flight.user = user3
  flight.save

  puts ""
  puts "#{trip.name} created"
end

def create_mi_music(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
  trip = Trip.new(
    name: "Electro Festival",
    street: "Beach Drive",
    zip: "FL 98432",
    city: "Miami",
    country: "United States",
    max_price: 700,
    flight_class: "Economy",
    start_date: DateTime.new(2020, 12, 04, 16, 00, 00),
    end_date: DateTime.new(2020, 12, 06, 19, 00, 00),
    airport_code: "MIA",
    description: "Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi? Quisque vel tellus sit amet quam efficitur sagittis. Fusce aliquam pulvinar suscipit. Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Commodi iure nisi unde quas repellat eaque, eos ea voluptatibus praesentium eum, earum vitae consequuntur molestiae. 
    Mollitia officia illum enim praesentium modi?"
  )
    
  # Attaching a picture to the trip
  file = URI.open('https://res.cloudinary.com/hachiles/image/upload/v1606925574/Ultra-Music-Festival-2019_haesuo.jpg')
  trip.photo.attach(io: file, filename: 'trip.png', content_type: 'image/png')
  trip.host = avril
  trip.save

  # Selecting passengers
  user1 = traveler4
  user2 = traveler5
  user3 = traveler3

  # Assigning these users to the trip
  trip.users << user1
  trip.users << user2
  trip.users << user3

  # Generating a flightBooking for user1
  flight = FlightBooking.new(
    flight_number: "DL#{rand(1000..9999)}",
    departure_airport_code: "ORD",
    arrival_airport_code: trip.airport_code,
    airline: "Delta",
    price: 460,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 7),
    arrival_date_local: trip.start_date - (3600 * 2)
  )
  flight.trip = trip
  flight.user = user1
  flight.save

  # Generating a flightBooking for user2
  flight = FlightBooking.new(
    flight_number: "JB#{rand(1000..9999)}",
    departure_airport_code: "LAX",
    arrival_airport_code: trip.airport_code,
    airline: "Jet Blue",
    price: 640,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 10),
    arrival_date_local: trip.start_date - (3600 * 2)
  )
  flight.trip = trip
  flight.user = user2
  flight.save

  # Generating a flightBooking for user3
  flight = FlightBooking.new(
    flight_number: "AF#{rand(1000..9999)}",
    departure_airport_code: "CDG",
    arrival_airport_code: trip.airport_code,
    airline: "Air France",
    price: 695,
    flight_class: trip.flight_class,
    departure_date_local: trip.start_date - (3600 * 11),
    arrival_date_local: trip.start_date - (3600 * 3)
  )
  flight.trip = trip
  flight.user = user3
  flight.save

  puts ""
  puts "#{trip.name} created"
end

# Call methods to create trips
create_la_tech(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
create_ny_music(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
create_lv_bday(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)
create_mi_music(traveler1, traveler2, traveler3, traveler4, traveler5, avril, michelle)

puts ""
puts "Creating a few invitations"

# Create invitations
la_tech = Trip.find_by(street: "N Heliotrope Dr")
inv1 = Invitation.create!(trip_id: la_tech.id, email: "ulysse.bondy@hotmail.com")

ny_music = Trip.find_by(street: "11th Avenue")
inv2 = Invitation.create!(trip_id: ny_music.id, email: "traveler1@gmail.com")
inv3 = Invitation.create!(trip_id: ny_music.id, email: "m.williams@gmail.com")

lv_bday = Trip.find_by(street: "Las Vegas Bd.")
inv4 = Invitation.create!(trip_id: lv_bday.id, email: "ulysse.bondy@hotmail.com")
inv5 = Invitation.create!(trip_id: lv_bday.id, email: "traveler2@gmail.com")



puts ""
puts "Seeding completed, have a good day!"
