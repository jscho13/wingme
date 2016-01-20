FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jscho#{n}@gmail.com" }
    first_name "Joseph"
    last_name "Cho"
    gender "Male"
    sequence (:password) { |n| "Applied#{n}" }
  end
end
