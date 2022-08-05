class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.order(start_at: :asc)
  end

  def new
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @start_at = @reservation.start_at
    @end_at = @reservation.end_at
    @days = (@end_at - @start_at).to_i
    @total = @room.price.to_i * @reservation.people.to_i * @days
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約を確定しました"
      redirect_to reservation_path(@reservation.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private
  
  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :people, :room_id, :user_id, :room_image)
  end

end