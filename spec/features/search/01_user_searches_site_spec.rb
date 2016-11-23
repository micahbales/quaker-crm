require 'rails_helper'

RSpec.feature "user searches site" , %Q(
  As a Quaker leader
  I want to search the website for key words
  So that I can quickly locate an individual, group, or meeting that belongs to me
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting, an individual, and a group
  # [] When I enter a search term into the search bar at the top right hand side
  #    of the page, and click "Submit", I am presented with a list of search results
  #    that includes any individual, group, or meeting that meets those criteria
  # [] If no matching terms are found, I receive an error message
  # [] The search only returns results that my user account has created

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let(:another_meeting) { FactoryGirl.create(:meeting, user: another_user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:another_group) { FactoryGirl.create(:group, meeting: another_meeting) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }
  let!(:another_individual) { FactoryGirl.create(:individual, meeting: another_meeting) }

  scenario "user searches for individual" do

    visit root_path
    fill_in("Search", with: "#{individual.first_name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("#{individual.first_name}")
    expect(page).to have_content("Results for \"#{individual.first_name}\"")
  end

  scenario "user searches for individual created by another account" do

    visit root_path
    fill_in("Search", with: "#{another_individual.first_name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("No results found. Please try another search.")
    expect(page).to have_content("Results for \"#{another_individual.first_name}\"")
  end

  scenario "user searches for group" do

    visit root_path
    fill_in("Search", with: "#{group.name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("#{group.name}")
    expect(page).to have_content("Results for \"#{group.name}\"")
  end

  scenario "user searches for group created by another account" do
    visit root_path
    fill_in("Search", with: "#{another_group.name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("No results found. Please try another search.")
    expect(page).to have_content("Results for \"#{another_group.name}\"")
  end

  scenario "user searches for meeting" do
    visit root_path
    fill_in("Search", with: "#{meeting.name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("#{meeting.name}")
    expect(page).to have_content("Results for \"#{meeting.name}\"")
  end

  scenario "user searches for meeting created by another account" do
    visit root_path
    fill_in("Search", with: "#{another_meeting.name}")
    click_button("Search")

    # confirm current_path once known
    expect(page).to have_content
    expect(page).to have_content("No results found. Please try another search.")
    expect(page).to have_content("Results for \"#{another_meeting.name}\"")
  end
end
