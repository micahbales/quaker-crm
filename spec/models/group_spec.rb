require "rails_helper"

RSpec.describe Group do
  it { should have_valid(:name).when("a", "124151", "yo2$%z") }
  it { should_not have_valid(:name).when(nil, "") }
  it { should belong_to(:meeting) }
  it { should have_many(:group_assignments) }
  it { should have_many(:individuals) }
end
