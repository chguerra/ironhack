# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

Faction.create(name: "Terran")
Faction.create(name: "Protoss")
Faction.create(name: "Zerg")

Jarray = [*1..10]

Jarray.each do |element|
  Player.create(name: "Player#{element}")
  Match.create(duration: "#{element*10} minutes", date: time_rand, winner_id: rand(1..10), loser_id: rand(1..10), winner_faction: rand(1..3), loser_faction: rand(1..3))
end
