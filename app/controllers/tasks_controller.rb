class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @room = Room.find(params[:room_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end
end
