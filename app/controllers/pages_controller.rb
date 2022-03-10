require "date"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  helper_method :today_tomorrow

  def home
  end

  def setup
    @household = current_user.households.last
  end

  def roommate
    @roommates = []
  end

  def roommateavatar
  end

  def dashboard
    @household = current_user.households.last
    @housemates = @household.users
    @user = current_user
    @tasks = @user.tasks.sort_by {|task| task.date}

  end

  def select_household
    @household = current_user.household
  end

end
