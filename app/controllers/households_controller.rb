class HouseholdsController < ApplicationController
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)
    @household.user = current_user
    if @household.save
      redirect_to setup_path
    else
      render :new
    end
  end

  private

  def household_params
    params.require(:household).permit(:name)
  end
end
