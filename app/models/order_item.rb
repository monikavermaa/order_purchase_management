class OrderItem < ApplicationRecord
  belongs_to :order

  before_validation :calculate_total_amount, on: :create

  private

  def calculate_total_amount
    self.total_amount = price * quantity
  end
end
