require 'rails_helper'

RSpec.feature "user creates congregation" , %Q(
  As a congregational leader
  I want to create a congregation
  So that I can keep track of its details
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged-in user
  # [] I can create a congregation with a name (required), address, phone, website, and affiliation
  # [] When I successfully create a congregation, I receive a confirmation message
  # [] When I fail to provide a name for the congregation, I receive an error message

  let(:user) { FactoryGirl.create(:user) }

  scenario "" do
  end
end
