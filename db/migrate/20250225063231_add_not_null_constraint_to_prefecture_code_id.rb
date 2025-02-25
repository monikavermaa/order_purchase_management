class AddNotNullConstraintToPrefectureCodeId < ActiveRecord::Migration[8.0]
  def change
    add_reference :souko_zaikos, :prefecture_code, foreign_key: true, null: true
  end
end
