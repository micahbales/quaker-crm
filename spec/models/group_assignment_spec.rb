require "rails_helper"

RSpec.describe GroupAssignment, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:individual) }

  describe "group_id/individual_id combo must be unique" do
    it "non-unique group_assignment creation fails" do
      individual = FactoryGirl.create(:individual)
      group = FactoryGirl.create(:group)
      FactoryGirl.create(:group_assignment, individual: individual, group: group)

      expect{ FactoryGirl.create(:group_assignment, individual_id: individual, group_id: group) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
