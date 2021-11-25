class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, presence: true
  validates :item_status_id, presence: true
  validates :item_delivery_free_id, presence: true
  validates :shipping_area_id , presence: true
  validates :days_to_ship_id , presence: true
  validates :price , presence: true, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :item_delivery_free
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
