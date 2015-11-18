# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jarray = [*1..60]

jarray.each do |element|

	Project.create(name: "Project #{element}", description: "Description number #{element}")
	Entry.create(hours: element+3, minutes: element, comments: "this is fucking #{element}", project_id: rand(24), date: Time.now)
	
end


