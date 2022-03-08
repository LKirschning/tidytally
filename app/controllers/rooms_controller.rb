class RoomsController < ApplicationController

  def index
    @household = Household.where(user: current_user).last
    #@household = current_user.households.last
    #@household = HouseholdUser.where(user:current_user).household
    @rooms = Room.where(household: @household)
  end

  def show
    @room = Room.find(params[:id])
    @tasks = @room.tasks
  end

  def new
    @room = Room.new
    @household = Household.where(user: current_user).last
  end

  def create
      @room = Room.new(room_params)
    @household = current_user.households.last
    @room.household = @household
    if @room.save!
      redirect_to setup_path
    else
      render :new
    end
  end

  def add_room
      @room = Room.new(name: params[:name])
    @household = current_user.households.last
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
