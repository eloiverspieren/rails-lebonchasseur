# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hunt.destroy_all
User.destroy_all

u1 = User.create!(email: "hunter1@gmail.com", password: "villaret")
u1.hunts.create!(
    name: "La Canarderie",
    address: "480 bis rue Albert Bailly Marcq en Baroeul",
    day_price: "1200euros",
    capacity: "12 guns",
    description: "La Canarderie is a 120 acres hunting property, gifted with several lakes and forests.
                  The shelfter is warm and can greet 12 to 15 hunters and their dogs for nights and suppers.
                  The main quarries are ducks, snips and boars."
    )

u1.hunts.create!(
    name: "Le Rohan",
    address: "Moulin Enghilbert, France",
    day_price: "6000euros",
    capacity: "15 guns",
    description: "Le Rohan is a large 400 acres hunting property, gifted with several lakes and forests.
                  The shelfter is warm and can greet 15 to 20 hunters and their dogs/horses for nights and suppers.
                  The main quarries are deers, lynx and boars."
    )

u1.hunts.create!(
    name: "La Bruyere",
    address: "Le Touquet, France",
    day_price: "3000euros",
    capacity: "15 guns",
    description: "La Bruyère is a 200 acres hunting property, gifted with 4 lakes and forests.
                  The shelfter is warm and can greet 10 to 12 hunters and their dogs for nights and suppers.
                  The main quarries are ducks, hares and also fishing."
    )
