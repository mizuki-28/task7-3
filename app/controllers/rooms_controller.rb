class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
  end
  
  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to room_path(@room)
    else
      flash[:alert] = "登録できませんでした"
      render :new
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def result
    if params[:address] == ''
      @addresses = Room.all
    elsif
      @addresses = Room.where('address LIKE ?','%' + params[:address] + '%' )
    end
  end

  def search
    if params[:search] == ''
      @searches = Room.all
    else
      @searches = Room.where('room_title LIKE ? OR room_body LIKE ? OR address LIKE ?','%'+params[:search]+'%','%'+params[:search]+'%','%'+params[:search]+'%')
    end
  end

  private

  def room_params
    params.require(:room).permit(:user_id, :room_title, :room_body, :price, :address, :room_image)
  end

end
