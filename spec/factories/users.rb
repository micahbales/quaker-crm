FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jimmy#{n}@yahoo.com" }
    password "password"
  end
end
