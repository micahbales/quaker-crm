class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_user!
    if current_user.nil?
      flash[:notice] = "You are not authorized to view this resource"
      redirect_to root_path
    end
  end

  def authorize_meeting_owner!
    @meeting = Meeting.find(params[:id])
    if !current_user.meetings.include?(@meeting)
      flash[:notice] = "You are not authorized to view this resource"
      redirect_to dashboard_path
    end
  end

  def authorize_individual_owner!
    unless @authorize == true
      @meeting = Meeting.find(params[:meeting_id])
      if !current_user.meetings.include?(@meeting)
        flash[:notice] = "You are not authorized to view this resource"
        redirect_to dashboard_path
      end
    end
  end
end
