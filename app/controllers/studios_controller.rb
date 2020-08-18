class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def index
    @studios = Studio.all
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.create(studio_params)
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end

  def show
    set_studio
  end

  def studio_params
    params.require(:studio).permit(:address, :title, :price, :description, :country, :city, :zipcode, :latitude, :longitude)
  end

  def set_studio
    @studio = Studio.find(params[:id])
  end
end
