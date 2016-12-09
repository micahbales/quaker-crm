require "rails_helper"

RSpec.describe GroupAssignment, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:individual) }
end
