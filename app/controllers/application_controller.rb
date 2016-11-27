class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def after_sign_in_path_for(user)
    dashboard_path
  end

  def authorize_user!
    if current_user.nil?
      flash[:error] = "You are not authorized to view this resource"
      redirect_to root_path
    end
  end

  def authorize_meeting_owner!
    @meeting = Meeting.find(params[:id])
    if !current_user.meetings.include?(@meeting)
      flash[:error] = "You are not authorized to view this resource"
      redirect_to dashboard_path
    end
  end

  def authorize_individual_group_owner!
    @meeting = Meeting.find(params[:meeting_id])
    if !current_user.meetings.include?(@meeting)
      flash[:error] = "You are not authorized to view this resource"
      redirect_to dashboard_path
    end
  end

  private

  def record_not_found
    flash[:error] = "You are not authorized to view this resource"
    redirect_to dashboard_path
  end
end
