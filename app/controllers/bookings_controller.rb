class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_studio, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
    # refactor with pundit, .where is activerecord
    # policies :)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.create(booking_params)
    @booking.user = current_user
    @booking.studio = @studio
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
      # redirect_to studio_path(@studio)
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def booking_params
    params.require(:booking).permit(:time_in, :time_out, :value, :booked)
  end
end
