# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jarray = [*1..25]


jarray.each do |seed|
	Contact.create(name: "name#{seed}", address: "address#{seed}", phone_number: "phone#{seed}", email: "name#{seed}@gmail.com")
end
