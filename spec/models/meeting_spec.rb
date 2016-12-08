require "rails_helper"

RSpec.describe Meeting do
  it { should have_valid(:name).when("Bob's House", "The Library") }
  it { should_not have_valid(:name).when(nil, "") }
end
