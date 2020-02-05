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

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Updated Location!"
      redirect_to location_path
    else
      flash[:danger] = "Not saved, please try again"
      render 'edit'
    end
  end


private
  def location_params
    params.require(:location).permit(:name, :description)
  end
end
