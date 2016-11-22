class GroupAssignmentsController < ApplicationController

  def create
    @meeting = Meeting.find(params["meeting_id"])
    @individual = Individual.find(params["individual_id"])

    if params["group_assignment"]["group"].blank?
      flash[:alert] = "Please select a valid group!"
      redirect_to meeting_individual_path(@meeting, @individual)
    else

      @group = Group.find(params["group_assignment"]["group"])
      @group_assignment = GroupAssignment.new(group_id: @group.id, individual_id: @individual.id)

      if @group_assignment.save
        flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been added to #{@group.name}!"
        redirect_to meeting_individual_path(@meeting, @individual)
      else
        flash[:alert] = "#{@individual.first_name} #{@individual.last_name} is already a member of #{@group.name}!"
        redirect_to meeting_individual_path(@meeting, @individual)
      end
    end
  end

  def destroy
    @meeting = Meeting.find(params["meeting_id"])
    @individual = Individual.find(params["individual_id"])

    if params["group_assignment"]["group"].blank?
      flash[:alert] = "Please select a valid group!"
      redirect_to meeting_individual_path(@meeting, @individual)
    else

      @group = Group.find(params["group_assignment"]["group"])
      @group_assignment = GroupAssignment.where(group_id: @group.id, individual_id: @individual.id).first

      if @group_assignment.nil?
        flash[:alert] = "#{@individual.first_name} #{@individual.last_name} was not a member of #{@group.name}!"
        redirect_to meeting_individual_path(@meeting, @individual)
      else
        @group_assignment.destroy
        flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been removed from #{@group.name}!"
        redirect_to meeting_individual_path(@meeting, @individual)
      end
    end
  end

  def add_or_remove
    if params["commit"] == "+"
      create
    elsif params["commit"] == "-"
      destroy
    end
  end
end
