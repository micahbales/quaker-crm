require 'rails_helper'

RSpec.feature "user creates group" , %Q(
  As a Quaker leader
  I want to create a group
  So that I can keep track of the committees and small groups my people are involved in
) do

  # Acceptance Criteria:

  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] On the dashboard, I am presented with an option to create a group
  # [x] I am redirected to a form where I can provide a name (required),
  #    description, and meeting (required) for the group
  # [x] If I provide valid information, I receive a confirmation message
  # [x] If I fail to provide valid information, I receive an error

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  before { login_user(user) }

  scenario "user successfully creates group (with description)" do

    visit meeting_path(meeting)
    click_link("Add Group")
    fill_in("Group Name", with: "Ministry & Oversight")
    fill_in("Description", with: "M&O works with the pastor to help discern God's will for the meeting, and to provide pastoral care to the congregation.")
    click_button("Submit")

    expect(current_path).to eq(meeting_path(meeting))
    expect(page).to have_content("Ministry & Oversight")
    expect(page).to have_content("Group successfully created!")
  end

  scenario "user successfully creates group (without description)" do

    visit meeting_path(meeting)
    click_link("Add Group")
    fill_in("Group Name", with: "Ministry & Oversight")
    click_button("Submit")

    expect(current_path).to eq(meeting_path(meeting))
    expect(page).to have_content("Ministry & Oversight")
    expect(page).to have_content("Group successfully created!")
  end

  scenario "user fails to provide group name" do

    visit meeting_path(meeting)
    click_link("Add Group")

    fill_in("Description", with: "M&O works with the pastor to help discern God's will for the meeting, and to provide pastoral care to the congregation.")
    click_button("Submit")

    expect(current_path).to_not eq(meeting_path(meeting))
    expect(page).to_not have_content("Ministry & Oversight")
    expect(page).to have_content("Name can't be blank")
  end
end
