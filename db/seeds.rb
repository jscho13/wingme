require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  User.create(
    email: Faker::Email,
    name: Faker::Name,
    gender: 'Male',
    password: '12341234'
  )
end

User.create(
  email: 'jscho13@gmail.com',
  name: 'Joseph Cho',
  gender: 'Male',
  password: '12341234'
)
