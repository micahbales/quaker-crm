require 'rails_helper'

RSpec.feature "user adds individual to group" , %Q(
  As a Quaker leader
  I want to add an individual to a group
  So that I can keep track of who is involved
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created a group
  # [] When I visit the profile page of an individual, I have an option to add
  #    that individual to a group
  # [] I can select an existing group from a drop-down select box
  # [] When I click to submit:
  #     [] The individual is added to the group
  #     [] I see a success message
  #     [] I see the individual show page, with a list of which groups that
  #        individual is part of
  #     [] If I navigate to the group show page, I can see which users are part
  #        of that group

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "user successfully adds an individual to a group" do

    login_user(user)
    visit meeting_path(meeting)
    click_link("#{individual.first_name} #{individual.last_name}")
    select(group.name)
    click_button("+")

    expect(current_path).to eq(meeting_individual_path(meeting, individual))
    expect(page).to have_content("#{individual.first_name} #{individual.last_name} has been added to #{group.name}!")
    expect(page).to have_content("#{group.name}")

    visit meeting_group_path(meeting, group)

    expect(page).to have_content("#{individual.first_name} #{individual.last_name}")
  end
end
