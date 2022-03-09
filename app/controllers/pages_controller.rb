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
    # @tasks = []
    # @household.rooms.each do |room|
    #   room.tasks.each do |task|
    #     @tasks.push(task)
    #   end
    # end
    # # the justice algortihm
    # @tasks.each do |task|
    #   task.user = @housemates.sample
    # end
    @user = current_user
    def today_tomorrow(task_date)
      date = Date.today
      case task_date
      when date.to_s
        "today"
      when (date + 1).to_s
        "tomorrow"
      else
        task_date
      end
    end
    # @time = today_tomorrow(@task.time)

  end

  def select_household
    @household = current_user.household
  end

end
