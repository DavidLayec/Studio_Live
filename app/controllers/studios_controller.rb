class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @studios = policy_scope(Studio).geocoded.where.not(latitude: nil, longitude: nil)
    @markers = @studios.map do |studio|
      { lat: studio.latitude,
        lng: studio.longitude }
    end
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.create(studio_params)
    @studio.user = current_user
    authorize @studio
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def show
    set_studio
    @studio.user = current_user
    authorize @studio
  end

  def destroy
    set_studio
    @studio.destroy
    redirect_to root_path
    authorize @studio
  end

  private

  def studio_params
    params.require(:studio).permit(:address, :title, :price, :description, :country, :city, :zipcode, :latitude, :longitude)
  end

  def set_studio
    @studio = Studio.find(params[:id])
  end
end
