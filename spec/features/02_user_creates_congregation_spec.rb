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

    visit "/"
    click_link("Dashboard")
    click_link("Create a new congregation")
    fill_in "Name"
    fill_in "Address"
    fill_in "Phone Number"
    fill_in "Website"
    fill_in "Affiliation"
    click_button("Submit")

    expect(page).to have_content("Your congregation has been created!")
  end

  scenario "user successfully creates a congregation, filling in name only" do

    visit "/"
    click_link("Dashboard")
    click_link("Create a new congregation")
    fill_in "Name"
    click_button("Submit")

    expect(page).to have_content("Your congregation has been created!")
  end

  scenario "user fail to create congregation (no name provided)" do

    visit "/"
    click_link("Dashboard")
    click_link("Create a new congregation")
    fill_in "Address"
    fill_in "Phone Number"
    fill_in "Website"
    fill_in "Affiliation"
    click_button("Submit")

    expect(page).to have_content("Name can't be blank")
  end
end
