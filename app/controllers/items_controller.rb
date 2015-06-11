class ItemsController < ApplicationController
  def index
    @items = Item.all
    @activities = Activity.all
  end

  def show
    @item = Item.find(params[:id])
    @activities = Activity.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:name]
    @item.activity_id = params[:activity_id]
    @item.description = params[:description]
    @item.necessity_rating = params[:necessity_rating]

    if @item.save
      redirect_to :back, :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.name = params[:name]
    @item.activity_id = params[:activity_id]
    @item.description = params[:description]
    @item.necessity_rating = params[:necessity_rating]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/items", :notice => "Item deleted."
  end
end
