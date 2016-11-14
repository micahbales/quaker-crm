require 'rails_helper'

RSpec.feature "user views meeting details" , %Q(
  As a Quaker leader
  I want to view a meeting's details
  So that I have access to the meeting's information
) do

  # Acceptance Critera:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [] When I visit the a meeting's page, I can see all information provided
  #    for that meeting - including name, address, phone, website, and affiliation

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }

  scenario "authenticated user successfuly views meeting information" do

    login_user(user)
    visit meeting_path(meeting)

    expect(page).to have_content("New City Friends Meeting")
    expect(page).to have_content("101 Quaker Lane")
    expect(page).to have_content("1234567890")
    expect(page).to have_content("www.newcityfriends.org")
    expect(page).to have_content("Great State Yearly Meeting")
  end
end
