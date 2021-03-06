class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @activities = Activity.all
  end

  def show
    @location = Location.find(params[:id])
    @activities = Activity.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new
    @location.city = params[:city]
    @location.country = params[:country]
    @location.activity_id = params[:activity_id]

    if @location.save
      redirect_to :back, :notice => "Location created successfully."
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])

  end

  def update
    @location = Location.find(params[:id])

    @location.city = params[:city]
    @location.country = params[:country]
    @location.activity_id = params[:activity_id]

    if @location.save
      redirect_to "/locations", :notice => "Location updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])

    @location.destroy

    redirect_to "/locations", :notice => "Location deleted."
  end
end
