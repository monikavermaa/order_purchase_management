class CreatePrefectureCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :prefecture_codes do |t|
      t.string :name, null: false  # Prefecture name (e.g., 茨城県)
      t.string :code, null: false  # Prefecture code (e.g., 01)
      t.string :ew_flag, null: false  # E for East, W for West
      
      t.timestamps
    end
  end
end
