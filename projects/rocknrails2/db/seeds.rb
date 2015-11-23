def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

jarray = [*1..25]


jarray.each do |element|

  Concert.create(band: "Band#{element}", venue: "Venue#{element}", city: "City#{element}", date: time_rand, price: element*rand(50), description: "Description of the current event is for this and that and #{element}" )
  City.create(name: "City-#{element}")
end
