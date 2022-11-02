class HouseholdsController < ApplicationController
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)
    @household.user = current_user
    if @household.save
      @household_user = HouseholdUser.create(user: current_user, household: @household)
      redirect_to setup_path
    else
      render :new
    end
  end

  def edit
    # raise
    @household = Household.find(params[:id])
    @user = current_user
  end

  def update
    @household = Household.find(params[:id])
    @new_user = User.find_by(email: params[:other][:emails])
    # check if user was found in database
    unless @new_user.nil? 
      @new_household_user = HouseholdUser.create(user: @new_user, household: @household) 
      @new_user.household = @household 
      @new_user.save
    end
    # current_user.household = @household
    redirect_to setup_path
  end

  private

  def household_params
    params.require(:household).permit(:name)
  end
end
