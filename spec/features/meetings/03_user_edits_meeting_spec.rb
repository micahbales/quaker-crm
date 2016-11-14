require 'rails_helper'

RSpec.feature "user deletes meeting" , %Q(
  As a Quaker leader
  I want to edit a meeting
  To correct errors in its details
) do

  Acceptance Criteria:

  # [] I must be a logged in user
  # [] I must have created a meeting
  # [] When I visit the meeting show page, I have an option to edit the meeting
  # [] I can change any of the meetings attributes
  # [] If I do, I am shown a confirmation message
  # [] If I leave a required field blank (name), I am shown an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }

  scenario "user successfully deletes meeting" do
  end
end
