class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_number, null: false
      t.integer :shipping_area_id, null: false
      t.string :city_town_village, null: false
      t.string :address_number, null: false
      t.string :buliding_name
      t.string :tel_number, null:false
      t.timestamps
    end
  end
 end
 
