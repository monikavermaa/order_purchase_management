class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :role, null: false, default: "customer"

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
