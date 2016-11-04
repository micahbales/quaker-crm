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

  scenario "user succesfully creates new account and is logged in" do
  end

  scenario "account creation fails due to duplicate email" do
  end

  scenario "account creation fails due to no email provided" do
  end

  scenario "account creation fails due to non-matching passwords" do
  end

  scenario "account creation fails due to password not provided" do
  end

end
