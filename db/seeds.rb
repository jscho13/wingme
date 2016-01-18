# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'jscho13@gmail.com', first_name: 'Joseph', last_name: 'Cho', gender: 'M')
user_2 = User.create(email: 'krdixon83@gmail.com', first_name: 'Dickson', last_name: 'Lau', gender: 'M')
user_3 = User.create(email: 'shinshiny@gmail.com', first_name: 'Hannah', last_name: 'Shin', gender: 'F')
Friend.create(user_id: user.id, users_friend_id: user_2.id)
Friend.create(user_id: user.id, users_friend_id: user_3.id)
