# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jarray = [*1..10]

jarray.each do |element|
    Player.create(name: "Player#{element}")
    Tournament.create(name: "Tournament#{element}")
    Registration.create(player_id: rand(9), tournament_id: rand(9))
end
