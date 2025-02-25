class DashboardController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    # Data to be displayed in the dashboard view
  end

  private

  def set_data
    # Orders overview
    @orders = Order.order(created_at: :desc).limit(10) # Display last 10 orders for quick overview

    # Total stock in all warehouses
    @total_stock_east = SoukoZaiko.where(warehouse_code: 'EAST').sum(:stock)
    @total_stock_west = SoukoZaiko.where(warehouse_code: 'WEST').sum(:stock)

    # Stock status per SKU
    @stock_status = SoukoZaiko.group(:sku_code).sum(:stock)

    # Prefecture code data (East/West flag)
    @prefecture_codes = PrefectureCode.all

    # Recently added items (optional, depends on the data you have)
    @recent_items = SoukoZaiko.order(created_at: :desc).limit(5)
  end
end
