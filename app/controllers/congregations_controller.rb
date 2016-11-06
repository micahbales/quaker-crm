class CongregationsController < ApplicationController
  def new
    @congregation = Congregation.new
  end

  def create
    @congregations = Congregation.all
    @congregation = Congregation.new(congregation_params)
    @congregation.user = current_user

    if @congregation.save
      flash[:alert] = "Meeting Created!"
      redirect_to :dashboard
    else

      flash[:error] = @congregation.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def congregation_params
    params.require(:congregation).permit(:name, :address, :phone, :website, :affiliation, :user_id)
  end
end
