FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "My Group #{n}" }
    description "At causae alterum denique nec, nam sale semper ea, homero eligendi maiestatis et quo."
    meeting
  end
end
