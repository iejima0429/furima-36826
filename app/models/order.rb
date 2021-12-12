class Order < ApplicationRecord
  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id, format: { other_than: 1 , message: "can't be blank"}
    validates :city_town_village, format: { with: /\A\d{10..11}\z/ }
    validates :address_number
    validates :tel_number
    end
    belongs_to :sold_out
    belongs_to :shipping_area
   
end
