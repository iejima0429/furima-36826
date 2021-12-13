class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
 def index
  @items = Item.all
  @item = Item.find(params[:item_id])
  @order = Order.new
 end
  
 def create
  @order = Order.new(order_params)
  if @order.valid?
    @order.save
    return redirect_to root_path
  else
    render 'index'
  end
 end

 private

 def order_params
   params.require(:order).permit(:number, :exp_month, :exp_yea, :cvc, :post_number, :shipping_area_id, :city_town_village, :address_number, :buliding_name, :tel_number)
 end
  
end 