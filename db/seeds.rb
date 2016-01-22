require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: 'jscho13@gmail.com',
  first_name: 'Joseph',
  last_name: 'Cho',
  gender: 'Male',
  password: '12341234'
)

User.create(
  email: 'krdixon83@gmail.com',
  first_name: 'Dickson',
  last_name: 'Lau',
  gender: 'Male',
  password: '12341234'
)

User.create(
  email: 'shinshiny@gmail.com',
  first_name: 'Hannah',
  last_name: 'Shin',
  gender: 'Female',
  password: '12341234'
)

User.create(
  email: 'jrpespisa@verizon.net',
  first_name: 'John',
  last_name: 'Pespisa',
  gender: 'Male',
  password: '12341234'
)

User.create(
  email: 'amywernerallen@arcadiasolutions.com',
  first_name: 'Amy',
  last_name: 'Werner',
  gender: 'Female',
  password: '12341234'
)

User.create(
  email: 'leonrusso@gmail.com',
  first_name: 'Leon',
  last_name: 'Russo',
  gender: 'Male',
  password: '12341234'
)

User.create(
  email: 'jujukoo@gmail.com',
  first_name: 'Julie',
  last_name: 'Gendrano',
  gender: 'Female',
  password: '12341234'
)

UserFriend.create(
  user_id: 1,
  friend_id: 2,
  pending: false
)

UserFriend.create(
  user_id: 2,
  friend_id: 1,
  pending: false
)
