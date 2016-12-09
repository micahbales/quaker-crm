require "rails_helper"

RSpec.describe Individual do
  it { should have_valid(:first_name).when("a", "Bobby", "TK421") }
  it { should_not have_valid(:first_name).when(nil, "") }
  it { should have_valid(:last_name).when("a", "Bobby", "TK421") }
  it { should_not have_valid(:last_name).when(nil, "") }
  it { should belong_to(:meeting) }
  it { should have_many(:groups) }
  it { should have_many(:group_assignments) }
end
