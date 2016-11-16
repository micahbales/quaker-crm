require 'rails_helper'

RSpec.feature "user views group" , %Q(
  As a Quaker leader
  I want to view a group
  So that I can learn its purpose and who is in it
) do

  # Acceptance Criteria
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created a group
  # [] When I visit my meeting's page, I can click a link to view my group

  let(:user) { FactoryGirl.create(:user) }
  let(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:group) { FactoryGirl.create(:group, meeting: meeting) }

  scenario "user views group" do

    login_user(user)
    visit meeting_path(meeting)
    click_link(group.name)

    expect(page).to have_content(group.name)
    expect(page).to have_content(group.description)
  end
end
