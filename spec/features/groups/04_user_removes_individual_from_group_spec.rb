require "rails_helper"

RSpec.feature "user removes individual from group" , %Q(
  As a Quaker leader
  I want to remove an individual from a group
  So that I can keep my committee and small group assignments up-to-date
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged in user
  # [] I must have created a meeting
  # [] I must have created an individual and a group
  # [] I must have added an individual to a group
  # [] I can select a group from a drop-down select box
  # [] When I click the "-" button:
  #     [] The individual is removed from the group
  #     [] I see a success message
  #     [] I see the individual show page, with a list of which groups that
  #        individual is part of (the removed group does not appear)
  #     [] If I navigate to the group show page, the individual is no longer
  #         listed as belonging to the group

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:group2) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:group3) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:group4) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }
  let!(:group_assignment) { FactoryGirl.create(:group_assignment, individual: individual, group: group) }
  let!(:group_assignment) { FactoryGirl.create(:group_assignment, individual: individual, group: group2) }
  let!(:group_assignment) { FactoryGirl.create(:group_assignment, individual: individual, group: group3) }

  scenario "user successfully removes an individual to a group" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")

    expect(page).to have_content("Groups: #{individual.groups.first.name}")

    select(group.name)
    click_button("-")

    expect(current_path).to eq(meeting_individual_path(meeting, individual))
    expect(page).to have_content("#{individual.first_name} #{individual.last_name} has been removed from #{group.name}!")
    expect(page).to_not have_content("Groups: #{individual.groups.first.name}")

    visit meeting_group_path(meeting, group)

    expect(page).to_not have_content("#{individual.first_name} #{individual.last_name}")
  end

  xscenario "user removes individual to 3 groups" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")

    expect(page).to have_content("Groups: #{individual.groups.first.name}, #{individual.groups[1].name}, #{individual.groups[2].name}")

    select(group.name)
    click_button("-")

    select(group2.name)
    click_button("-")

    select(group3.name)
    click_button("-")

    expect(page).to_not have_content("Groups: #{individual.groups.first.name}, #{individual.groups[1].name}, #{individual.groups[2].name}")
  end

  xscenario "user selects group where individual is not a member" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    select(group4.name)
    click_button("-")

    expect(page).to have_content("#{individual.first_name} #{individual.last_name} was already not a member of #{group.name}!")
  end
end
