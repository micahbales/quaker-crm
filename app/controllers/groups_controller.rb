class GroupsController < ApplicationController

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @group = Group.new
  end
end
