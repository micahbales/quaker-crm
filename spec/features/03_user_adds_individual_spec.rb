require 'rails_helper'

RSpec.feature "user adds individual" , %Q(
  As a Quaker leader
  I want to add individuals to my meeting
  So that I can stay up-to-date on their information
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged in user
  # [] I must have created a meeting
  # [] I can add an individual to my meeting with a name (required), address, email, phone, birthday, and notes
  # [] When I successfully add a user, I receive a confirmation message
  # [] When I fail to provide a name, I receive an error message

  let!(:user) { FactoryGirl.create(:user) }
  let!(:meeting) { FactoryGirl.create(:meeting) }

  scenario "" do

  end

end
