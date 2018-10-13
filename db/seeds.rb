# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

allegra = User.create(username: "allegra", email: "allegra@gmail.com", password: "123")
aya = User.create(username: "aya", email: "aya@gmail.com", password: "123")


nice_trip = Trip.create(
  name: 'Weekend in Nice',
  country: 'France',
  location: "Nice, Côt d'Azure",
  things_did: "Lunch and beach",
  notes: 'best weekend ever! Met Naomi & mum on Saturday at Freo',
  date_from: '2018-05-22',
  date_to: '2018-05-25',
  user_id: 1
)

nice_trip = Trip.create(
  name: 'Weekend in Nice',
  country: 'France',
  location: "Nice, Côt d'Azure",
  things_did: "Lunch and beach",
  notes: 'best weekend ever! Had fun at Le Lebo',
  date_from: '2018-05-22',
  date_to: '2018-05-25',
  user_id: 2
)

# allegra.trips << nice_trip
# aya.trips << nice_trip

# :name, :country, :location, :things_did, :notes, :date_from, :date_to
