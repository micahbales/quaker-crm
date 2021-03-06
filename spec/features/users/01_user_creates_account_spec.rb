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

  let(:user) { FactoryGirl.build(:user) }
  let(:user1) { FactoryGirl.create(:user) }

  scenario "user succesfully creates new account and is logged in" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: user.email)
    fill_in("Password", with: "password")
    fill_in("Confirm password", with: "password")
    click_button("Submit")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Your account has been created!")
  end

  scenario "account creation fails due to no email provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Password", with: "password")
    fill_in("Confirm password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Email can't be blank")
  end

  scenario "account creation fails due to non-matching passwords" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: user.email)
    fill_in("Password", with: "password")
    fill_in("Confirm password", with: "passwordz")
    click_button("Submit")

    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario "account creation fails due to password not provided" do

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: user.email)
    click_button("Submit")

    expect(page).to have_content("Password can't be blank")
  end

  scenario "account creation fails due to duplicate email" do
    user1

    visit root_path
    click_link("Sign Up")
    fill_in("Email", with: user1.email)
    fill_in("Password", with: "password")
    fill_in("Confirm password", with: "password")
    click_button("Submit")

    expect(page).to have_content("Email has already been taken")
  end
end
