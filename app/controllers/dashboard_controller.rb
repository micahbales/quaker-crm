class DashboardController < ApplicationController
  before_action :authorize_user!
end
