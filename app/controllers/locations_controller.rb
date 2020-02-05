class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "New Location created!"
      redirect_to location_path @location
    else
      flash[:danger] = "Location not created"
      render "new"
    end
  end

private
  def location_params
    params.require(:location).permit(:name, :description)
  end
end
