class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:query].present?
      # sql_query = "title ILIKE :query \
      # OR description ILIKE :query \
      # OR address ILIKE :query \
      # "
      @studios = Studio.search_by_title_description_and_address(params[:query])
    else
      @studios = Studio.all
    end

    @markers = @studios.map do |studio|
    { lat: studio.latitude,
      lng: studio.longitude
      # infoWindow: render_to_string(partial: "info_window", locals: { studio: studio })
    }
    end
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

    # @booking = Booking.new
    # @booking.user = current_user
    # @booking.studio = @studio
    # why are the bookings here and not studios?

    # authorize @booking
  end

  private

  def studio_params
    params.require(:studio).permit(:address, :title, :price, :description, :country, :city, :zipcode, :latitude, :longitude, :photo)
  end

  def set_studio
    @studio = Studio.find(params[:id])
  end
end
