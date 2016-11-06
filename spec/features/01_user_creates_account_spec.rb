require 'rails_helper'

RSpec.feature "user creates account" , %Q(
  As a Quaker leader
  I want to be able to log into the site
  So that I can set up my congregation
) do

  # Acceptance Criteria:
  #
  # [x] I must provide an email and password
  # [x] My password and confirmation password must match
  # [x] My email must not duplicate that of an existing user
  # [x] When I log in successfully, I receive a confirmation message
  # [x] When I enter invalid information, I receive an error message

  let(:user) { FactoryGirl.create(:user) }

  scenario "user succesfully creates new account and is logged in" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Your account has been created!")
  end

  scenario "account creation fails due to duplicate email" do
    user

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy1@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Email has already been taken")
  end

  scenario "account creation fails due to no email provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Email can't be blank")
  end

  scenario "account creation fails due to non-matching passwords" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "passwordz")
    click_button("Submit")

    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "account creation fails due to password not provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy@yahoo.com")
    click_button("Submit")

    expect(page).to have_content("Password can't be blank")
  end
end
