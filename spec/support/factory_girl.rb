FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jscho#{n}@gmail.com" }
    sequence(:password) { |n| "Applied#{n}" }
    name "Joseph Cho"
    gender "Male"
  end
end
