require 'rails_helper'

RSpec.feature "user deletes individual" , %Q(
  As a Quaker leader
  I want to delete an individual from my Meeting
  Because they are no longer involved in the community
) do

  # Acceptance Criteria:
  #
  # [x] I must be a logged in user
  # [x] I must have created a meeting
  # [x] I must have created an individual
  # [x] I can visit an individual's profile page via the meeting page
  # [x] Via a link on the profile page, I can visit the update page
  # [] On the update page, I have an option to delete the individual
  # [] Before the individual is deleted, I am asked to confirm

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting, user: user) }
  let!(:individual) { FactoryGirl.create(:individual, meeting: meeting) }

  scenario "" do

  end

end
