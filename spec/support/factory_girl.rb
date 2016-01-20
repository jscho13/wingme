FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jscho#{n}@gmail.com" }
    sequence(:password) { |n| "Applied#{n}" }
    first_name "Joseph"
    last_name "Cho"
    gender "Male"
  end
end
