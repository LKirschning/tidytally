class HouseholdsController < ApplicationController
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)
  end

  private

  def household_params
    params.require(:household).permit(:name)
  end
end
