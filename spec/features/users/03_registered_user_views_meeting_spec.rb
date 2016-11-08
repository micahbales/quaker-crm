require 'rails_helper'

RSpec.feature "registered user may view meetings that they created" , %Q(
  As a Quaker leader
  I want to see only the Meetings that I have created
  To keep things simple, and to preserve the privacy of all users
) do

  # Acceptance Criteria:
  #
  # [] I must be a logged in user
  # [] When I visit the dashboard, I see any Meetings that I have created
  # [] I do not see Meetings that my user did not create
  # [] If I visit a URL for a meeting that is not my own, I am redirected
  #    to my dashboard and receive an error message


  scenario "" do

  end
end
