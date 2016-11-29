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

  def multisearch_results_filter(search_results)
    @results = []

    def verify_user(result)
      if @meeting.user_id == current_user.id
          @results << result
      end
    end

    search_results.each do |result|
      if result.searchable_type == "Meeting"
        @meeting = Meeting.find(result.searchable_id)
        verify_user(result)
      elsif result.searchable_type == "Individual"
        individual = Individual.find(result.searchable_id)
        @meeting = Meeting.find(individual.meeting_id)
        verify_user(result)
      elsif result.searchable_type == "Group"
        group = Group.find(result.searchable_id)
        @meeting = Meeting.find(group.meeting_id)
        verify_user(result)
      end
    end
    @results
  end

end
