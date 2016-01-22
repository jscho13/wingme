require 'carrierwave/test/matchers'

describe PictureUploader do
  include CarrierWave::Test::Matchers

  let!(:user_1) do
    User.create(
      email: 'jscho13@gmail.com',
      name: 'Joseph Cho',
      gender: 'M',
      password: 'Applied91'
    )
  end

  before do
    PictureUploader.enable_processing = true
    @uploader = PictureUploader.new(user_1, :picture)

    File.open('app/assets/images/test_picture.jpg') do |f|
      @uploader.store!(f)
    end
  end

  after do
    PictureUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 200 by 200 pixels" do
      expect(@uploader.thumb).to have_dimensions(200, 200)
    end
  end

  context 'the small version' do
    it "should scale down a landscape image to fit within 800 by 800 pixels" do
      expect(@uploader).to be_no_larger_than(800, 800)
    end
  end

  it "unsure of differences between permissions 644 and 600" do
    expect(@uploader).to have_permissions(0644)
  end
end
