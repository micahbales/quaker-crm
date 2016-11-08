class IndividualsController < ApplicationController
  before_action :authorize_user!, :authorize_individual_owner!

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

  def edit
    @individual = Individual.find(params[:id])
    @meeting = Meeting.find(params[:meeting_id])
  end

  def update
    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.find(params[:id])
    @individual.birthday = DateTime.new(params[:birthday]["year"].to_i, params[:birthday]["month"].to_i, params[:birthday]["day"].to_i)

    if @individual.update(individual_params)
      flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been updated!"
      redirect_to [@meeting, @individual]
    else
      flash[:errors] = @individual.errors.full_messages.to_sentence
      @individual = Individual.find(@individual.id)
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @individual = Individual.find(params[:id])

    if @individual.delete
      flash[:alert] = "#{@individual.first_name} #{@individual.last_name} has been deleted from #{@meeting.name}"
      redirect_to @meeting
    else
      flash[:error] = @individual.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def individual_params
    params.require(:individual).permit(:first_name, :last_name, :address, :email, :phone, :birthday, :notes)
  end
end
