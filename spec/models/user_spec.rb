require 'spec_helper'

describe User do

  it { should have_many :friends }
  it { should have_many :matches }

  describe "unique email validations" do
    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it "validates for an incorrect password length" do
    expect(FactoryGirl.build(:user, password: "abc123")).to_not be_valid
  end

  it "validates for a correct user" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "validates for a correct gender" do
    user = FactoryGirl.create(:user, gender: "Other")
    expect(user).to be_valid
  end

  it "validates for an incorrect gender" do
    expect(FactoryGirl.build(:user, gender: "Hello")).to_not be_valid
  end

  it "validates for a complete name" do
    user = FactoryGirl.build(:user, first_name: "")
    expect(user).to_not be_valid
  end

  it "validates for a complete name" do
    user = FactoryGirl.build(:user, last_name: "")
    expect(user).to_not be_valid
  end
end
