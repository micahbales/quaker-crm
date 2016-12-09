require "rails_helper"

RSpec.describe Group, type: :model do
  it { should have_valid(:name).when("a", "124151", "yo2$%z") }
  it { should_not have_valid(:name).when(nil, "") }
  it { should belong_to(:meeting) }
  it { should have_many(:group_assignments) }
  it { should have_many(:individuals) }

  describe "dependent destroy" do
    it "destroys associated group_assignments" do
      group = FactoryGirl.create(:group)
      group_assignment = FactoryGirl.create(:group_assignment)

      group.group_assignments << group_assignment
      group_assignment_id = group_assignment.id
      group.destroy

      expect{ GroupAssignment.find(group_assignment_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
