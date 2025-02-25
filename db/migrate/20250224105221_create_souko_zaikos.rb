class CreateSoukoZaikos < ActiveRecord::Migration[8.0]
  def change
    create_table :souko_zaikos do |t|
      t.string :warehouse_code, null: false  # EAST / WEST
      t.string :sku_code, null: false  # SKU Code (SKU0001, SKU0002, etc.)
      t.string :stock_type, null: false  # 01 - Available, 02 - Sold
      t.integer :stock, null: false  # Stock quantity
      
      t.timestamps
    end
  end
end
