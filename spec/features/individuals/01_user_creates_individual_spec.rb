require 'rails_helper'

RSpec.feature "user creates individual" , %Q(
  As a Quaker leader
  I want to add individuals to my meeting
  So that I can stay up-to-date on their information
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I can add an individual to my meeting with a first name and last name (required), address, email, phone, birthday, and notes
  # [x] When I successfully add a user, I receive a confirmation message
  # [x] When I fail to provide a name, I receive an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }

  scenario "user successfully adds individual to congregation" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Add Individual")
    fill_in("First Name", with: "Jim")
    fill_in("Last Name", with: "Bo")
    fill_in("Address", with: "101 Jimmy's Place")
    fill_in("Email", with: "jimmy@jimbo.com")
    fill_in("Phone", with: "1234567890")
    select("29")
    select("January")
    select("1995")
    fill_in("Notes", with: "Great guy.")
    click_button("Submit")

    expect(page).to have_content("Jim Bo has been added to #{meeting.name}!")
    expect(page).to have_content("Friends")
  end

  scenario "individual is created as long as there is a name" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Add Individual")
    fill_in("First Name", with: "Jim")
    fill_in("Last Name", with: "Bo")
    click_button("Submit")

    expect(page).to have_content("Jim Bo has been added to #{meeting.name}!")
    expect(page).to have_content("Friends")
  end

  scenario "individual is not created when no name is provided" do

    login_user(user)
    visit dashboard_path
    click_link(meeting.name)
    click_link("Add Individual")
    fill_in("Address", with: "101 Jimmy's Place")
    fill_in("Email", with: "jimmy@jimbo.com")
    fill_in("Phone", with: "1234567890")
    select("29")
    select("January")
    select("1995")
    fill_in("Notes", with: "Great guy.")
    click_button("Submit")

    expect(page).to have_content("First name can't be blank and Last name can't be blank")
    expect(page).to_not have_content("Friends")
  end

end
