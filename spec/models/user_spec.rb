require "rails_helper"

RSpec.describe "when User is deleted, all dependent meetings are destroyed" do
  it "dependent: :destroy" do
    user = FactoryGirl.create(:user)
    meeting = FactoryGirl.create(:meeting)

    user.meetings << meeting
    meeting_id = meeting.id
    user.destroy

    expect{ Meeting.find(meeting_id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
