class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @item = Item.order("created_at DESC")
    @items = Item.all
    
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
  end

 def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
 end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_status_id, :item_delivery_free_id, :shipping_area_id, :days_to_ship_id, :image, :price).merge(user_id: current_user.id)
  end
end