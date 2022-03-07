class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def setup
  end

  def roommate
    @roommates = []
  end

  def dashboard
    @household = current_user.household
    @housemates = @household.users
    @tasks = []
    @household.rooms.each do |room|
      room.tasks.each do |task|
        @tasks.push(task)
      end
    end
    # the justice algortihm
    @tasks.each do |task|
      task.user = @housemates.sample
    end
    @user = current_user
  end

end
