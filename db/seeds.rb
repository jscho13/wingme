require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times do
  User.create(
    name: Faker::Name.name,
    gender: ['Male', 'Female', 'Other'].sample,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    password: '12341234',
    picture: Faker::Avatar.image,
    city: Faker::Address.city
  )
end

User.create(
  email: 'jscho13@gmail.com',
  name: 'Joseph Cho',
  gender: 'Male',
  password: '12341234'
)
