require 'rails_helper'

RSpec.feature "user deletes individual" , %Q(
  As a Quaker leader
  I want to delete an individual from my Meeting
  Because they are no longer involved in the community
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created an individual
  # [x] I can visit an individual's profile page via the meeting page
  # [x] Via a link on the profile page, I can visit the update page
  # [] On the update page, I have an option to delete the individual
  # [] If I click to delete, I receive a notification that the individual has
  #    been deleted from the meeting

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "user clicks to delete individual" do
    login_user
    visit edit_meeting_individual_path(meeting, individual)
    click_button("Delete Profile")

    expect(page).to have_content("#{individual.first_name} #{individual.last_name} has been deleted from #{meeting.name}")
  end
end
