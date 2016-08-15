def random_department
  array = %w(Sales Marketing Technical)
  array[rand(3)]
end

1000.times do
  Support.create name: Faker::Pokemon.name,
                 department: random_department,
                 email: Faker::Internet.email,
                 message: Faker::StarWars.quote
end
