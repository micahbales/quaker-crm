FactoryGirl.define do
  factory :meeting do
    sequence(:name) { |n| "New#{n} City#{n} Friends#{n} Meeting#{n}" } 
    address "101 Quaker Lane"
    phone "1234567890"
    website "www.newcityfriends.org"
    affiliation "Great State Yearly Meeting"
    user
  end
end
