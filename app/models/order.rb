class Order < ApplicationRecord
  belongs_to :sold_out
  belongs_to :shipping_area
end
