require 'rails_helper'

RSpec.feature "user creates group" , %Q(
  As a Quaker leader
  I want to create a group
  So that I can keep track of the committees and small groups my people are involved in
) do

  # Acceptance Criteria:

  # [x] I must be a logged in user
  # [x] I must have created a meeting and at least one individual
  # [] On the dashboard, I am presented with an option to create a group
  # [] I am redirected to a form where I can provide a name (required),
  #    description, and meeting (required) for the group
  # [] If I provide valid information, I receive a confirmation message
  # [] If I fail to provide valid information, I receive an error

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "user successfully creates group (with description)" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("Add Group")
    fill_in("Group Name", with: "Ministry & Oversight")
    select(meeting.name, from: "Meeting")
    fill_in("Description", with: "M&O works with the pastor to help discern God's will for the meeting, and to provide pastoral care to the congregation.")
    click_button("Submit")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Ministry & Oversight")
    expect(page).to have_content("Group successfully created!")
  end

  scenario "user successfully creates group (without description)" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("Add Group")
    fill_in("Group Name", with: "Ministry & Oversight")
    select(meeting.name, from: "Meeting")
    click_button("Submit")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Ministry & Oversight")
    expect(page).to have_content("Group successfully created!")
  end

  scenario "user fails to provide group name" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("Add Group")
    select(meeting.name, from: "Meeting")
    fill_in("Description", with: "M&O works with the pastor to help discern God's will for the meeting, and to provide pastoral care to the congregation.")
    click_button("Submit")

    expect(current_path).to_not eq(dashboard_path)
    expect(page).to have_content("Ministry & Oversight")
    expect(page).to have_content("Group Name can't be blank")
  end
end
