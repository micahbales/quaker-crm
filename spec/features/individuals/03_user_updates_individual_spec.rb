require 'rails_helper'

RSpec.feature "user updates individual" , %Q(
  As a Quaker leader
  I want to update individuals
  So that everyone's information is accurate
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created an individual
  # [x] I can visit an individual's profile page via the meeting page
  # [] Via a link on the profile page, I can visit an update page to correct information
  # [] If I update information correctly, I receive a notification
  # [] If I leave a required field blank, I am informed of the error

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "user updates individual's first and last names" do

    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    click_link("Update #{individual.first_name}'s information")
    fill_in("First Name", with: "Jim")
    fill_in("Last Name", with: "Bo")
    click_button("Update")

    expect(page).to have_content("Record updated!")
    expect(page).to have_content("Jim Bo")
  end

  xscenario "user updates individual's email" do

    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    click_link("Update #{individual.first_name}'s information")
    fill_in("Email", with: "jimmy@jimbo.com")
    click_button("Update")

    expect(page).to have_content("Record updated!")
    expect(page).to have_content("jimmy@jimbo.com")
  end

  xscenario "user updates individual's birthday" do

    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    click_link("Update #{individual.first_name}'s information")
    select("21")
    select("December")
    select("1909")
    click_button("Update")

    expect(page).to have_content("Record updated!")
    expect(page).to have_content("1909-12-21")
  end

  xscenario "user gets error for leaving a required field blank" do

    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    click_link("Update #{individual.first_name}'s information")
    fill_in("First Name", with: "")
    click_button("Update")

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Update #{user.first_name} #{user.last_name}")
  end
end
