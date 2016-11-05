require 'rails_helper'

RSpec.feature "user creates account" , %Q(
  As a congregational leader
  I want to be able to log into the site
  So that I can set up my congregation
) do

  # Acceptance Criteria:
  #
  # [] I must provide an email and password
  # [] My password and confirmation password must match
  # [] My email must not duplicate that of an existing user
  # [] When I log in successfully, I receive a confirmation message
  # [] When I enter invalid information, I receive an error message

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
    fill_in("Email", with: "jimmy@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")

    expect(page).to have_content("That email already exists! Please choose another")
  end

  scenario "account creation fails due to no email provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Email not provided")
  end

  scenario "account creation fails due to non-matching passwords" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "passwordz")
    click_button("Submit")

    expect(page).to have_content("Passwords did not match")
  end

  scenario "account creation fails due to password not provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: "jimmy@yahoo.com")
    click_button("Submit")

    expect(page).to have_content("Password cannot be blank")
  end
end
