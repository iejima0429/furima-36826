class OrdersController < ApplicationController
  before_action :move_to_signed_in, only: :index
  
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
    pay_item
    @order_address.save
    return redirect_to root_path
  else
    render :index
  end
 end

 private

 def order_params
   params.require(:order_address).permit(:post_number, :shipping_area_id, :city_town_village, :address_number, :buliding_name, :tel_number, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end

def move_to_signed_in
  unless user_signed_in?
    redirect_to  '/users/sign_in'
  end
end
  
end 