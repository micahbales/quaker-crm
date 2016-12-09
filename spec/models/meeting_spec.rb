require "rails_helper"

RSpec.describe Meeting do
  it { should have_valid(:name).when("Bob's House", "The Library") }
  it { should_not have_valid(:name).when(nil, "") }
  it { should belong_to(:user)}
  it { should have_many(:groups) }
  it { should have_many(:individuals) }

  describe "dependent destroy" do
    it "destroys associated individuals" do
      meeting = FactoryGirl.create(:meeting)
      individual = FactoryGirl.create(:individual)

      meeting.individuals << individual
      individual_id = individual.id
      meeting.destroy

      expect{ Individual.find(individual_id )}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "destroys associated groups" do
      meeting = FactoryGirl.create(:meeting)
      group = FactoryGirl.create(:group)

      meeting.groups << group
      group_id = group.id
      meeting.destroy

      expect{ Group.find(group_id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
