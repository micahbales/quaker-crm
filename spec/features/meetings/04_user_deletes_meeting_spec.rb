require 'rails_helper'

RSpec.feature "user deletes meeting" , %Q(
  As a Quaker leader
  I want to delete a meeting
  Because I no longer need its records
) do

  Acceptance Criteria:

  # [] I must be a logged in user
  # [] I must have created a meeting
  # [] When I visit the meeting edit page, I have an option to delete the meeting
  # [] If I delete the meeting, I am sent to the dashboard and notified that
  #    the meeting has been deleted

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }

  scenario "user successfully deletes meeting" do
  end
end
