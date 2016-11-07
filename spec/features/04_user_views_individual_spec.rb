require 'rails_helper'

RSpec.feature "user views individual" , %Q(
  As a Quaker leader
  I want to view an individual's details
  So that I can locate their contact info and other information
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created an individual
  # [x] I can visit an individual's profile page via a listed link on the meeting's page
  # [x] I can view an individual's first name and last name, address, email, phone, birthday, and notes

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "visit individual page via meeting page" do

    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")

    expect(page).to have_content("#{individual.first_name} #{individual.last_name}")
    expect(page).to have_content(individual.address)
    expect(page).to have_content(individual.email)
    expect(page).to have_content(individual.phone)
    expect(page).to have_content(individual.birthday)
    expect(page).to have_content(individual.notes)
  end

end
