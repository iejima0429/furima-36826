class Buy < ApplicationRecord
  with_options presence: true do
  validates :post_number
  validates :shipping_area_id
  validates :city_town_village
  validates :address_number
  validates :tel_number
  end
  belongs_to :sold_out
end


