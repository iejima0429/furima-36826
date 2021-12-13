class Order < ApplicationRecord
  with_options presence: true do
  
    end
    belongs_to :sold_out
    belongs_to :shipping_area
end
