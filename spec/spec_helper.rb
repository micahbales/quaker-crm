RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def register_user
    visit new_user_registration_path
    fill_in("Email", with: "jimmy1@yahoo.com")
    fill_in("Password", with: "password")
    fill_in("Confirm Password", with: "password")
    click_button("Submit")
  end

  def login_user
    visit new_user_session_path
    fill_in("Email", with: "jimmy1@yahoo.com")
    fill_in("Password", with: "password")
    click_button("Log in")
  end
end
