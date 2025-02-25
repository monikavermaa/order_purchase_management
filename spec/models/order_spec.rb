require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "associations" do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should belong_to(:user) }
  end
  
  describe "nested attributes" do
    it { should accept_nested_attributes_for(:order_items) }
  end

  describe "validations" do
    let!(:user) { create(:user) }
    let!(:order) { create(:order, order_number: "2024022400001", user: user) }
  
    it "validates uniqueness of order_number" do
      duplicate_order = build(:order, order_number: order.order_number, user: user)
      expect(duplicate_order).not_to be_valid
      expect(duplicate_order.errors[:order_number]).to include("has already been taken")
    end
  end
  
end
