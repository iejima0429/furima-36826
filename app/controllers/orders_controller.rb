class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
 def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
 end

 def new
  @order_address = OrderAddress.new
 end
  
 def create
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
    Payjp.api_key = "sk_test_34e3dee756d8e85ac2e80d3a"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
    @order_address.save
    redirect_to root_path
  else
    render :index
  end
 end

 private

 def order_params
   params.require(:order_address).permit(:post_number, :shipping_area_id, :city_town_village, :address_number, :buliding_name, :tel_number, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
 end
  
end 