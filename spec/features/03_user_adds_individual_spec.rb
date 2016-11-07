require 'rails_helper'

RSpec.feature "user adds individual" , %Q(
  As a Quaker leader
  I want to add individuals to my meeting
  So that I can stay up-to-date on their information
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [] I can add an individual to my meeting with a first name and last name (required), address, email, phone, birthday, and notes
  # [] When I successfully add a user, I receive a confirmation message
  # [] When I fail to provide a name, I receive an error message

  let!(:meeting) { FactoryGirl.create(:meeting) }

  scenario "user successfully adds individual to congregation" do
    login_user
    visit dashboard_path
    click_link("New City Friends Meeting")
    click_link("Add individual to New City Friends Meeting")
    fill_in("First Name", with: "Jim")
    fill_in("Last Name", with: "Bo")
    fill_in("Address", with: "101 Jimmy's Place")
    fill_in("Email", with: "jimmy@jimbo.com")
    fill_in("Phone", with: "1234567890")
    save_and_open_page
    select("29", from: "Birthday")
    select("January", from: "Birthday")
    select("1995", from: "Birthday")
    fill_in("Notes", with: "Great guy.")
    click_button("Add Person")

    expect(page).to have_content("Jim Bo has been added to New City Friends Meeting!")
  end

  xscenario "individual is created as long as there is a name" do
    login_user
    visit dashboard_path
    click_link("New City Friends Meeting")
    fill_in("First Name", with: "Jim")
    fill_in("Last Name", with: "Bo")
    click_button("Add Person")

    expect(page).to have_content("Jim Bo has been added to New City Friends Meeting!")
  end

  xscenario "individual is not created when no name is provided" do
    login_user
    visit dashboard_path
    click_link("New City Friends Meeting")
    fill_in("Address", with: "101 Jimmy's Place")
    fill_in("Email", with: "jimmy@jimbo.com")
    fill_in("Phone", with: "1234567890")
    select("29", from: "Day")
    select("January", from: "Month")
    select("1995", from: "Year")
    fill_in("Notes", with: "Great guy.")
    click_button("Add Person")

    expect(page).to have_content("First Name can't be blank and Last Name can't be blank")
  end

end
