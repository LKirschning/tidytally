class RoomsController < ApplicationController

  def index
    @household = current_user.household
    @rooms = Room.where(household: @household)
  end


  def new
    @room = Room.new
  end

  def create
    @household = current_user.household
    # todo: include the household in room_params
    @room = Room.new(room_params)
    @room.household = @household
    if @room.save!
      redirect_to setup_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
