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
  "http://cdn.morguefile.com/imageData/public/files/m/markgraf/11/l/141720290022iyu.jpg",
  "https://41.media.tumblr.com/67dab79c965f2488440e7235da187ec2/tumblr_o1lqg4YsPQ1rqb4rwo1_1280.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xta1/t51.2885-15/sh0.08/e35/p750x750/12545438_734443283359841_1857678749_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xpf1/t51.2885-15/e35/12446209_1721540351465975_2131155680_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xpa1/t51.2885-15/e35/12545296_961901633900371_335778782_n.jpg",
  "https://40.media.tumblr.com/1a6bb21d05c1e7f2862bb221ef9ef301/tumblr_o1lkddQTg21riwhx4o1_1280.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xat1/t51.2885-15/e35/p480x480/12556084_1563182450638473_1374109311_n.jpg",
  "http://www.robotbutt.com/wp-content/uploads/2014/07/461777879.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xpt1/t51.2885-15/e35/12547318_1691702697783165_1995697415_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/hphotos-xap1/t51.2885-15/e35/12547675_1726940320884119_252067999_n.jpg",
  "https://41.media.tumblr.com/77c68c87c57695a4df2319cb1f74fab1/tumblr_o1m4cuVdvO1v17k85o1_500.jpg",
  "http://welife.s3.amazonaws.com/articles/images/000/000/174/original/bigstock-Worried-black-young-man-with-h-52268527.jpg?1385149150",
  "http://computableplant.ics.uci.edu/theses/guy/Guy%20Yosiphon_files/guy2.JPG",
  "http://media3.popsugar-assets.com/files/2015/03/30/626/n/1922398/fce9d1e1_edit_img_cover_file_15954503_1427722683_2Q_-2NSFIOl.xxxlarge/i/Male-Model-Math-Teacher.jpg",
  "https://41.media.tumblr.com/13aa136d341ccf35bcf8f3667fdff435/tumblr_o1baa9xW3x1ttp7o5o1_1280.jpg",
  "http://www.glamour.com/images/fashion/2015/12/gigi-hadid-kendall-jenner-discovered-model-h724.jpg",
  "http://orig13.deviantart.net/5ab6/f/2014/113/b/4/model_by_adysaputra13-d7fqym5.jpg",
  "https://static.pexels.com/photos/6980/summer-cute-hipster-beauty.jpg",
  "http://gaderinge.com/redesign/wp-content/uploads/uncategorized/asian-girl-with-flowers/asian-girl-flowers.jpg",
  "https://pixabay.com/static/uploads/photo/2013/03/27/12/21/girl-97088_960_720.jpg",
  "https://41.media.tumblr.com/7a9512691c23f91dd8d41f660f3d998b/tumblr_o1mbze6tDy1srlpa6o1_1280.jpg",
  "https://40.media.tumblr.com/9e00aeb8256b984da9f461a4c6233fab/tumblr_o1mjk3uy5o1uegiymo1_1280.jpg",
  "https://40.media.tumblr.com/2c5e08470fba14428cd53eb86395d99d/tumblr_o1mfvrSsDH1rg6mp2o1_1280.jpg",
  "http://www.themancompany.com/media/wysiwyg/johannes_strate_skarf_man_face_field_8373_1920x1080.jpg",
  "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/e35/12383552_445738938883923_177002505_n.jpg",
  "https://scontent-lga3-1.cdninstagram.com/t51.2885-15/sh0.08/e35/p750x750/12547537_224303904576353_964304367_n.jpg",
  "https://41.media.tumblr.com/c4f36cad7f0a2b54cc38df4c8297bcbb/tumblr_o1mi586XYB1sr5v8io1_1280.jpg",
  "http://www.beyondblackwhite.com/wp-content/uploads/2015/02/iStock_000050131992_Medium.jpg",
  "https://36.media.tumblr.com/e3ff8aff2d3bdd65ca76ddfd8508a543/tumblr_o1lz3dxkMK1srlpa6o1_1280.jpg",
  "https://41.media.tumblr.com/fa2e8b6c6c0331800c1d9670eeca521c/tumblr_o1mj3dJmcF1r9ljpro1_500.jpg",
  "https://41.media.tumblr.com/bd9f02903dc18f089939bcf51e50dee0/tumblr_o1m10o7XzH1v5wk8eo1_500.png"
]

31.times do |x|
  User.create(
    name: Faker::Name.name,
    gender: ['Male', 'Female', 'Other'].sample,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    password: '12341234',
    remote_picture_url: images[x-1],
    city: Faker::Address.city
  )
end

User.create(
  email: 'account1@gmail.com',
  name: 'Joseph Cho',
  gender: 'Male',
  password: '12341234',
  picture: File.open(File.join(Rails.root, 'app/assets/images/test_picture.jpg'))
)

User.create(
  email: 'account2@gmail.com',
  name: 'Amy Allen',
  gender: 'Female',
  password: '12341234',
  picture: File.open(File.join(Rails.root, 'app/assets/images/test_model.jpg'))
)
