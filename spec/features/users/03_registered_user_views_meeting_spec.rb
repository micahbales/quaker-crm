require 'rails_helper'

RSpec.feature "registered user may view meetings that they created" , %Q(
  As a Quaker leader
  I want to see only the Meetings that I have created
  To keep things simple, and to preserve the privacy of all users
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] When I visit the dashboard, I see any Meetings that I have created
  # [x] I do not see Meetings that my user did not create
  # [x] If I visit a URL for a meeting that is not my own, I am redirected
  #    to my dashboard and receive an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }


  scenario "registered user sees meeting they created" do
    login_user(user)

  end

  scenario "registered user does not see meeting they did not create" do

  end

  scenario "registered user views show page of meeting they created" do

  end

  scenario "registered user can't visit show page of meeting they didn't create" do

  end

  scenario "registered user can't visit show page of individual in meeting they didn't create" do

  end

  scenario "registered user can't visit edit page of individual in meeting they didn't create" do

  end
end
