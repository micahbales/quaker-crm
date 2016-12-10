require 'rails_helper'

RSpec.feature "user updates group" , %Q(
  As a Quaker leader
  I want to update a group
  So that its description and title are accurate
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created a group
  # [x] I have an option to update my group
  # [x] If I provide valid information, the group is updated and I receive
  #    a confirmation message
  # [x] If I leave the group's name blank, I am given an error message and
  #    the group is not updated

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }
  before { login_user(user) }

  scenario "user successfully updates group name and description" do

    visit meeting_group_path(meeting, group)
    click_link("Edit Group")
    fill_in("Group Name", with: group.name)
    fill_in("Description", with: "yo, this group is great!")
    click_button("Submit")

    expect(current_path).to eq(meeting_group_path(meeting, group))
    expect(page).to have_content("yo, this group is great!")
    expect(page).to have_content("#{group.name} successfully updated!")
  end

  scenario "user successfully updates group name, leaves description blank" do

    visit meeting_group_path(meeting, group)
    click_link("Edit Group")
    fill_in("Group Name", with: group.name)
    fill_in("Description", with: "")
    click_button("Submit")

    expect(current_path).to eq(meeting_group_path(meeting, group))
    expect(page).to have_content("#{group.name} successfully updated!")
  end

  scenario "user leaves group name blank" do

    visit meeting_group_path(meeting, group)
    click_link("Edit Group")
    fill_in("Group Name", with: "")
    fill_in("Description", with: "yo, this group is great!")
    click_button("Submit")

    expect(current_path).to eq(meeting_group_path(meeting, group))
    expect(page).to have_content("Name can't be blank")
  end
end
