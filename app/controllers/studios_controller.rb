class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @studios = Studio.all
  end

  def new
    @studio = Studio.new
    # authorize @studio
  end

  def create
    @studio = Studio.create(studio_params)
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def show
    set_studio
    # authorize @studio
    @booking = Booking.new
    @booking.user = current_user
    @booking.studio = @studio
    # authorize @booking
  end

  private

  def studio_params
    params.require(:studio).permit(:address, :title, :price, :description, :country, :city, :zipcode, :latitude, :longitude)
  end

  def set_studio
    @studio = Studio.find(params[:id])
  end
end
