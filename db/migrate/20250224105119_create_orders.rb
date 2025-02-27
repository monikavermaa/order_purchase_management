class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :order_number, null: false  # Order Number (YYYYMMDD00001)
      t.integer :total_amount, null: false  # Total amount of the order
      t.string :delivery_zipcode, null: false
      t.string :delivery_state, null: false  # Prefecture name (e.g., 茨城県)
      t.string :delivery_city, null: false
      t.string :delivery_area, null: false
      t.string :delivery_address, null: false
      t.integer :tax, null: false, default: 0  # Tax amount
      t.belongs_to  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
