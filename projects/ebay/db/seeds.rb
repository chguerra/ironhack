jarray = [*1..25]


jarray.each do |element|

  User.create(name: "Usuario #{element}", email: "usuario#{element}@gmail.com")

end
