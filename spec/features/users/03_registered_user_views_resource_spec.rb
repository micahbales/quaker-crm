require 'rails_helper'

RSpec.feature "registered user may view resources that they created" , %Q(
  As a Quaker leader
  I want to see only the Meetings that I have created
  To keep things simple, and to preserve the privacy of all users
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] When I visit the dashboard, I see any Meetings that I have created
  # [x] I do not see Meetings that my user did not create
  # [x] If I visit a URL for a resource that is not my own, I am redirected
  #    to my dashboard and receive an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:meeting2) { FactoryGirl.create(:meeting, user: user2) }
  let!(:individual2) { FactoryGirl.create(:individual, meeting: meeting2) }
  let!(:group2) { FactoryGirl.create(:group, meeting: meeting2) }

  scenario "registered user sees meeting they created" do
    login_user(user)
    visit dashboard_path
    click_link(meeting.name)

    expect(page).to have_content(meeting.name)
  end

  scenario "registered user does not see meeting they did not create" do
    login_user(user)
    visit dashboard_path

    expect(page).to_not have_content(meeting2.name)
  end

  scenario "registered user views show page of meeting they created" do
    login_user(user)
    visit meeting_path(meeting)

    expect(page).to have_content(meeting.name)
  end

  scenario "registered user can't visit show page of meeting they didn't create" do
    login_user(user)
    visit(meeting_path(meeting2))

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are not authorized to view this resource")
  end

  scenario "registered user can't visit show page of individual in meeting they didn't create" do
    login_user(user)
    visit(meeting_individual_path(meeting2, individual2))

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are not authorized to view this resource")
  end

  scenario "registered user can't visit edit page of individual in meeting they didn't create" do
    login_user(user)
    visit(edit_meeting_individual_path(meeting2, individual2))

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are not authorized to view this resource")
  end

  scenario "registered user can't visit show page of group in meeting they didn't create" do
    login_user(user)
    visit(meeting_group_path(meeting2, individual2))

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are not authorized to view this resource")
  end

  scenario "registered user can't visit edit page of group in meeting they didn't create" do
    login_user(user)
    visit(edit_meeting_group_path(meeting2, individual2))

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are not authorized to view this resource")
  end
end
