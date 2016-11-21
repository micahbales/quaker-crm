require "rails_helper"

RSpec.feature "user removes individual from group" , %Q(
  As a Quaker leader
  I want to remove an individual from a group
  So that I can keep my committee and small group assignments up-to-date
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged in user
  # [] I must have created a meeting
  # [] I must have created an individual and a group
  # [] I must have added an individual to a group
  # [] I can select a group from a drop-down select box
  # [] When I click the "-" button:
  #     [] The individual is removed from the group
  #     [] I see a success message
  #     [] I see the individual show page, with a list of which groups that
  #        individual is part of (the removed group does not appear)
  #     [] If I navigate to the group show page, the individual is no longer
  #         listed as belonging to the group

  scenario "" do

  end
end
