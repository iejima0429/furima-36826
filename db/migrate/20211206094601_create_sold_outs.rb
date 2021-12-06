class CreateSoldOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :sold_outs do |t|
      
      t.timestamps
    end
  end
end

