class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.belongs_to  :order, null: false, foreign_key: true  # Link to the order
      t.string :sku_code, null: false  # SKU Code for the item
      t.integer :quantity, null: false  # Quantity of the item ordered
      t.integer :price, null: false  # Price of a single item
      t.integer :total_amount, null: false  # Total for the item (price * quantity)
      t.timestamps
    end
  end
end


