class TasksController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @task = Task.new
  end

  def create
    @room = Room.find(params[:room_id])
    @task = Task.new(task_params)
    @task.room = @room
    @task.user = current_user.household.users.sample
    if @task.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def assign_to_user
    @tasks = Task.all
    @user = current_user
    @roommates = Household.where(id:@user.household)
  end

    private

  def task_params
    params.require(:task).permit(:name, :date, :interval)
  end
end
