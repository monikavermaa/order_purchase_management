class SoukoZaiko < ApplicationRecord
  validates :warehouse_code, presence: true
  validates :stock_type, inclusion: { in: ['01', '02'] }
  belongs_to :prefecture_code, optional: true
end
