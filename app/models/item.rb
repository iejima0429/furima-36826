class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_delivery_free_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_area_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price , presence: true, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  has_one_attached :image
  belongs_to :user
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :item_delivery_free
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
