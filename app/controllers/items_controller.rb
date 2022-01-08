class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: :edit
  
  def index
    @item = Item.order('created_at DESC')
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
    
  end

  def edit
   unless current_user.id == @item.user_id
    redirect_to action: :index
  end
  end

  def update

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

 def destroy
  if current_user.id == @item.user_id
    @item.destroy
    redirect_to action: :index
   end
 end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_status_id, :item_delivery_free_id, :shipping_area_id, :days_to_ship_id, :image, :price).merge(user_id: current_user.id)
  end
  
  def item_find
    @item = Item.find(params[:id])
  end
  

  def prevent_url
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end
  
end