require 'spec_helper'

RSpec.feature "user creates group" , %Q(
  As a Quaker leader
  I want to create a group
  So that I can keep track of the committees and small groups my people are involved in
) do

  Acceptance Criteria:

  # [] I must be a logged in user
  # [] I must have created a meeting and at least one individual
  # [] On the dashboard, I am presented with an option to create a group
  # [] I am redirected to a form where I can provide a name (required)
  #    and description for the group
  # [] If I provide valid information, I receive a confirmation message
  # [] If I fail to provide valid information, I receive an error

  scenario "user successfully creates group (with description)" do

  end

  scenario "user successfully creates group (without description)" do

  end

  scenario "user fails to provide group name" do

  end
end
