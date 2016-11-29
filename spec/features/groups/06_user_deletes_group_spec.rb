require 'rails_helper'

RSpec.feature "user deletes group" , %Q(
  As a Quaker leader
  I want to delete a group
  So that I only have groups that are active
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created a group
  # [x] When I click the "delete" button on the Group edit page, the group
  #     is deleted and I receive a confirmation message

  scenario "user successfully deletes group"
end
