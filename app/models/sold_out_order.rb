class SoldOutOrder
  include ActiveModel::Model
  attr_accessor :post_number, :shipping_area_id, :city_town_village, :address_number, :buliding_name, :tel_number, :sold_out_id, :item_id, :user_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city_town_village, format: { with: /\A\d{10..11}\z/ }
    validates :address_number
    validates :tel_number
    validates :sold_out_id
    validates :item_id
    validates :user_id
  end
  validates :shipping_area_id, numericality: {other_than: 1, message: "can't be blank"}
end