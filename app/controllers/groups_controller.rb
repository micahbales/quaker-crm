class GroupsController < ApplicationController
  before_action :authorize_user!, :authorize_individual_group_owner!

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.new(group_params)
    @group.meeting_id = params[:meeting_id]

    if @group.save
      flash[:success] = "Group successfully created!"
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

  def update
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:success] = "#{@group.name} successfully updated!"
      redirect_to meeting_group_path(@meeting, @group)
    else
      flash[:error] = @group.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :meeting_id)
  end
end
