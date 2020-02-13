class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

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
      redirect_to location_path(@location)
    else
      flash[:danger] = "Location not created"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update_attributes(location_params)
      flash[:success] = "Updated Location!"
      redirect_to location_path
    else
      flash[:danger] = "Not saved, please try again"
      render 'edit'
    end
  end

  def destroy
    @location.destroy
  end

private
  def location_params
    params.require(:location).permit(:name, :description)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
