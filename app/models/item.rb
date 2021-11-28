class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
  validates :item_name
  validates :item_info
  validates :image
  validates_inclusion_of :price, in:300..9999999
  end
  with_options  numericality: { other_than: 1 , message: "can't be blank"} do
  validates :item_category_id
  validates :item_status_id
  validates :item_delivery_free_id
  validates :shipping_area_id
  validates :days_to_ship_id
  end

  
  
  has_one_attached :image
  belongs_to :user
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :item_delivery_free
  belongs_to :shipping_area
  belongs_to :days_to_ship
 end
 