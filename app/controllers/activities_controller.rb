class ActivitiesController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
    @locations = Location.where(activity_id: params[:id])
    @items = Item.where(activity_id: params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new
    @activity.name = params[:name]

    if @activity.save
      redirect_to :back, :notice => "Activity created successfully."
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.name = params[:name]

    if @activity.save
      redirect_to "/activities", :notice => "Activity updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    redirect_to "/activities", :notice => "Activity deleted."
  end
end
