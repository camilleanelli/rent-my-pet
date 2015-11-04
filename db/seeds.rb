# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do

  Cat.create(
  :name   => Faker::Name.first_name,
  :description  => Faker::Lorem.paragraph,
  # :user_id => 1,
  :gender => "male",
  :availability => true,
  :race => "roux",
  :age => Faker::Number.between(1, 17),
  :price => 10,
  :zip_code => 75004,
  :city => "Paris",
  :address => " 16 Villa Gaudelet",

)



end
