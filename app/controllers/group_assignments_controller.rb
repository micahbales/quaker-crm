class GroupAssignmentsController < ApplicationController

  def create
    @meeting = Meeting.find(params["meeting_id"])
    @individual = Individual.find(params["individual_id"])
    @group = Group.find(params["group_assignment"]["group"])
    @group_assignment = GroupAssignment.new(group_id: @group.id, individual_id: @individual.id)

    if @group_assignment.save
      flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been added to #{@group.name}!"
      redirect_to meeting_individual_path(@meeting, @individual)
    else
      flash[:alert] = @group_assignment.errors.full_messages.to_sentence
      render meeting_individual_path(@meeting, @individual)
    end
  end
end
