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
  :description    => Faker::Lorem.sentences,
  :user_id => 1,
  :gender => "male",
  :availability => true,
  :race => "roux",
  :zip_code => 75000,
  :city => "Paris",
  :address => "Villa Gaudelet",

)



end
