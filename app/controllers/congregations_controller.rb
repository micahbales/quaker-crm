class CongregationsController < ApplicationController
  def new
    @congregation = Congregation.new
  end
end
