class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  before_action :set_studio, only: [:new, :create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.user = current_user
    @booking.studio = Studio.find(params[:studio_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to studio_path(@studio)
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def booking_params
    params.require(:booking).permit(:time_in, :time_out, :booked, :value)
  end
end
