require 'rails_helper'

RSpec.feature "registered user may view all pages" , %Q(
  As a Quaker leader
  I want my dashboard and information to be off limits to others
  So that my Meeting's data is kept private
) do

  # Acceptance Criteria:
  #
  # [x] User must be logged in
  # [x] If user is logged in, they may view all pages
  # [x] If user is not logged in, they may only view the dashboard

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "registered user may view home page" do
    login_user(user)
    visit root_path

    expect(page).to have_content("Quaker CRM")
  end

  scenario "registered user may view dashboard" do
    login_user(user)
    visit dashboard_path

    expect(page).to have_content(meeting.name)
  end

  scenario "registered user may view meeting show page" do
    login_user(user)
    visit meeting_path(meeting)

    expect(page).to have_content(meeting.name)
  end

  scenario "registered user may view individual show page" do
    login_user(user)
    visit meeting_individual_path(meeting, individual)

    expect(page).to have_content(individual.first_name)
  end

  scenario "registered user may view individual edit page" do
    login_user(user)
    visit edit_meeting_individual_path(meeting, individual)

    expect(page).to have_content(individual.first_name)
  end

  scenario "anonymous user may view home page" do
    visit root_path

    expect(page).to have_content("Quaker CRM")
  end

  scenario "anonymous user can't view dashboard" do
    visit dashboard_path

    expect(page).to_not have_content("Create a new meeting")
    expect(page).to have_content("You are not authorized to view this resource")
    expect(current_path).to eq(root_path)
  end

  scenario "anonymous user can't view meeting show page" do
    visit meeting_path(meeting)

    expect(page).to_not have_content(meeting.name)
    expect(page).to_not have_content("Create a new meeting")
    expect(page).to have_content("You are not authorized to view this resource")
    expect(current_path).to eq(root_path)
  end

  scenario "anonymous user can't view individual show page" do
    visit meeting_individual_path(meeting, individual)

    expect(page).to_not have_content(individual.first_name)
    expect(page).to_not have_content("Create a new meeting")
    expect(page).to have_content("You are not authorized to view this resource")
    expect(current_path).to eq(root_path)
  end

  scenario "anonymous user can't view individual edit page" do
    visit edit_meeting_individual_path(meeting, individual)

    expect(page).to_not have_content(individual.first_name)
    expect(page).to_not have_content("Create a new meeting")
    expect(page).to have_content("You are not authorized to view this resource")
    expect(current_path).to eq(root_path)
  end
end
