class MeetingsController < ApplicationController
  before_action :authorize_user!
  after_action :authorize_meeting_owner!, only: [:show]

  def new
    @meeting = Meeting.new
  end

  def create
    @meetings = Meeting.all
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user

    if @meeting.save
      flash[:alert] = "Meeting Created!"
      redirect_to :dashboard
    else

      flash[:error] = @meeting.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :address, :phone, :website, :affiliation, :user_id)
  end
end
