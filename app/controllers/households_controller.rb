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

  def edit
    @household = current_user.household
    @user = current_user
  end

  def update
    @household = current_user.household
    @household.user = User.find_by(email: params[:other][:emails])
    @household.save
    redirect_to setup_path
  end

  private

  def household_params
    params.require(:household).permit(:name)
  end
end
