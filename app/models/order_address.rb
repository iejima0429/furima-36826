class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city_town_village, :address_number, :buliding_name, :tel_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city_town_village
    validates :address_number
    validates :tel_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
  end
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, shipping_area_id: shipping_area_id, city_town_village: city_town_village, address_number: address_number, buliding_name: buliding_name, tel_number: tel_number, order_id: order.id)
  end
end