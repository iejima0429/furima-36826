class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number, null: false
      t.integer :shipping_area_id, null: false
      t.string :city_town_village, null: false
      t.string :address_number, null: false
      t.string :buliding_name
      t.string :tel_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
