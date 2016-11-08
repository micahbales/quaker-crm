class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_user!
    if current_user.nil?
      flash[:notice] = "You are not authorized to view this resource"
      redirect_to root_path
    end
  end
end
