require 'rails_helper'

RSpec.feature "user creates congregation" , %Q(
  As a congregational leader
  I want to create a congregation
  So that I can keep track of its details
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged-in user
  # [] I can create a congregation with a name (required), address, phone, website, and affiliation
  # [] When I successfully create a congregation, I receive a confirmation message
  # [] When I fail to provide a name for the congregation, I receive an error message

  let(:user) { FactoryGirl.create(:user) }

  scenario "user successfully creates a congregation, providing all information" do

    visit root_path
    login_user
    click_link("Dashboard")

    click_link("Create a new congregation")
    fill_in("Name", with: "New City Friends Meeting")
    fill_in("Address", with: "101 Meetinghouse Lane")
    fill_in("Phone", with: "1234567890")
    fill_in("Website", with: "www.newcityfriendsmeeting.org")
    fill_in("Affiliation", with: "Unaffiliated")
    click_button("Submit")

    expect(page).to have_content("Meeting Created!")
  end

  scenario "user successfully creates a congregation, filling in name only" do

    visit root_path
    login_user
    click_link("Dashboard")
    click_link("Create a new congregation")
    fill_in("Name", with: "New City Friends Meeting")
    click_button("Submit")

    expect(page).to have_content("Meeting Created!")
  end

  scenario "user fail to create congregation (no name provided)" do

    visit root_path
    login_user
    click_link("Dashboard")
    click_link("Create a new congregation")
    fill_in("Address", with: "101 Meetinghouse Lane")
    fill_in("Phone", with: "1234567890")
    fill_in("Website", with: "www.newcityfriendsmeeting.org")
    fill_in("Affiliation", with: "Unaffiliated")
    click_button("Submit")

    expect(page).to have_content("Name can't be blank")
  end
end
