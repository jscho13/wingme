require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)

images = [
  "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/sh0.08/e35/p750x750/12547537_224303904576353_964304367_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xta1/t51.2885-15/sh0.08/e35/p750x750/12545438_734443283359841_1857678749_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xpf1/t51.2885-15/e35/12446209_1721540351465975_2131155680_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xap1/t51.2885-15/e35/12547675_1726940320884119_252067999_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xpa1/t51.2885-15/e35/12545296_961901633900371_335778782_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xat1/t51.2885-15/e35/p480x480/12556084_1563182450638473_1374109311_n.jpg",
  "http://computableplant.ics.uci.edu/theses/guy/Guy%20Yosiphon_files/guy2.JPG",
  "http://media3.popsugar-assets.com/files/2015/03/30/626/n/1922398/fce9d1e1_edit_img_cover_file_15954503_1427722683_2Q_-2NSFIOl.xxxlarge/i/Male-Model-Math-Teacher.jpg",
  "http://www.glamour.com/images/fashion/2015/12/gigi-hadid-kendall-jenner-discovered-model-h724.jpg",
  "http://orig13.deviantart.net/5ab6/f/2014/113/b/4/model_by_adysaputra13-d7fqym5.jpg"
]

10.times do |x|
  User.create(
    name: Faker::Name.name,
    gender: ['Male', 'Female', 'Other'].sample,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    password: '12341234',
    remote_picture_url: images[x],
    city: Faker::Address.city
  )
end


User.create(
  email: 'jscho13@gmail.com',
  name: 'Joseph Cho',
  gender: 'Male',
  password: '12341234',
  picture: File.open(File.join(Rails.root, 'app/assets/images/test_picture.jpg'))
)

User.create(
  email: 'amy@example.com',
  name: 'Amy Allen',
  gender: 'Female',
  password: '12341234',
  picture: File.open(File.join(Rails.root, 'app/assets/images/test_model.jpg'))
)
