class IndividualsController < ApplicationController
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.new
  end
end
