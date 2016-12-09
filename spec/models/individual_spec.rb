require "rails_helper"

RSpec.describe Individual, type: :model do
  it { should have_valid(:first_name).when("a", "Bobby", "TK421") }
  it { should_not have_valid(:first_name).when(nil, "") }
  it { should have_valid(:last_name).when("a", "Bobby", "TK421") }
  it { should_not have_valid(:last_name).when(nil, "") }
  it { should belong_to(:meeting) }
  it { should have_many(:groups) }
  it { should have_many(:group_assignments) }

  describe "dependent destroy" do
    it "destroys associated group_assignments" do
      individual = FactoryGirl.create(:individual)
      group_assignment = FactoryGirl.create(:group_assignment)

      individual.group_assignments << group_assignment
      group_assignment_id = group_assignment.id
      individual.destroy

      expect{ GroupAssignment.find(group_assignment_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
