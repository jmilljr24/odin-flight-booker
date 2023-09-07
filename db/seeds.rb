# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Airport.destroy_all

# airport_list = ['NRT', 'Tokyo'],
#                ['PKX', 'Beijing'],
#                ['JFK', 'New York'],
#                ['LAX', 'Los Angeles'],
#                ['YYZ', 'Toronto'],
#                ['LHR', 'London'],
#                ['CDG', 'Paris'],
#                ['SYD', 'Sydney'],
#                ['ICN', 'Seoul']

# airport_list.each do |code, city|
#   Airport.create(code:, city:)
# end

# Flight Model
Flight.destroy_all
dates = (Date.today..(Date.today + 1.week)).to_a
airports = Airport.all

airports.each do |depart|
  airports.each do |arrive|
    next if depart == arrive

    length = rand(90..300)
    dates.each do |d|
      rand(1..3).times do
        Flight.create(
          departure: DateTime.new(d.year, d.month, d.day, rand(6..23), rand(0..59)),
          duration: length,
          departure_airport_id: depart.id,
          arrival_airport_id: arrive.id
        )
      end
    end
  end
end
