class RoomsController < ApplicationController

  def index
    @household = current_user.household
    @rooms = Room.where(household: @household)

  end


  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to new_task_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
