FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "My#{n} Group#{n}" }
    description "At causae alterum denique nec, nam sale semper ea, homero eligendi maiestatis et quo."
    meeting
  end
end
