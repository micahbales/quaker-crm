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

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }

  scenario "user successfully deletes group" do
    login_user(user)
    visit edit_meeting_group_path(meeting, group)
    click("Delete Group")

    expect(current_path).to eq(meetings_path(meeting))
    expect(page).to have_content("#{group.name} successfully deleted!")
  end
end
