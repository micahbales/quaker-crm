FactoryGirl.define do
  factory :individual do
    sequence(:first_name) {|n| "Bob#{n}"}
    sequence(:last_name) {|n| "Johnson#{n}"}
    sequence(:email) {|n| "bobby#{n}@aol.com"}
    sequence(:address) {|n| "10#{n} Fictional Ave"}
    phone "1234567890"
    sequence(:birthday) {|n| DateTime.new(1995,4,n) }
    notes "Aenean ut dui fermentum, sagittis tellus vitae, pulvinar dui. Donec et metus nisl. Nam gravida, ligula sit amet porta suscipit, elit purus malesuada quam, semper tristique elit lorem et erat."
  end
end
