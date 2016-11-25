require 'rails_helper'

RSpec.feature "user edits meeting" , %Q(
  As a Quaker leader
  I want to edit a meeting
  To correct errors in its details
) do

  # Acceptance Criteria:

  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] When I visit the meeting show page, I have an option to edit the meeting
  # [x] I can change any of the meetings attributes
  # [x] If I do, I am shown a confirmation message
  # [x] If I leave a required field blank (name), I am shown an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }

  scenario "user successfully edits meeting" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Edit Meeting")
    fill_in("Name", with: "New City Friends Meeting")
    fill_in("Address", with: "202 Quaker Lane")
    fill_in("Phone", with: "0987654321")
    fill_in("Website", with: "www.ncfm.org")
    fill_in("Affiliation", with: "Friends of Jesus Fellowship")
    click_button("Update")

    expect(page).to have_content("New City Friends Meeting successfully updated!")
    expect(page).to have_content("New City Friends Meeting")
  end

  scenario "meeting update successful with only one attribute updated" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Edit Meeting")
    fill_in("Phone", with: "0987654321")
    click_button("Update")

    expect(page).to have_content("#{meeting.name} successfully updated!")
    expect(page).to have_content(meeting.name)
  end

  scenario "meeting update fails: name submitted as blank" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Edit Meeting")
    fill_in("Name", with: "")
    fill_in("Address", with: "202 Quaker Lane")
    fill_in("Phone", with: "0987654321")
    fill_in("Website", with: "www.ncfm.org")
    fill_in("Affiliation", with: "Friends of Jesus Fellowship")
    click_button("Update")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content(meeting.name)
  end

end
