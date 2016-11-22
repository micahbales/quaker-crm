class GroupsController < ApplicationController

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.new(group_params)
    @group.meeting_id = params[:meeting_id]

    if @group.save
      flash[:alert] = "Group successfully created!"
      redirect_to @meeting
    else
      flash[:error] = @group.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.find(params[:id])
  end

  def edit
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :meeting_id)
  end
end
