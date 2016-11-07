class IndividualsController < ApplicationController
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.new
  end

  def create

    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.new(individual_params)
    @individual.birthday = DateTime.new(params[:birthday]["year"].to_i, params[:birthday]["month"].to_i, params[:birthday]["day"].to_i)
    @individual.meeting = @meeting

    if @individual.save
      flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been added to #{@meeting.name}!"
      redirect_to meeting_path(@meeting)
    else
      flash[:errors] = @individual.errors.full_messages.to_sentence
      render 'meetings/new'
    end
  end

  def show
    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.find(params[:id])
  end

  private

  def individual_params
    params.require(:individual).permit(:first_name, :last_name, :address, :email, :phone, :birthday, :notes)
  end
end