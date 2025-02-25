class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  validates :order_number, uniqueness: true
  belongs_to :user
  accepts_nested_attributes_for :order_items, allow_destroy: true
end
