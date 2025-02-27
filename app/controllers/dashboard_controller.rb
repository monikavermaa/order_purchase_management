class DashboardController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    # Data to be displayed in the dashboard view
  end

  private

  def set_data
    @orders = Order.order(created_at: :desc).limit(10)
    warehouse_stock = SoukoZaiko.where(warehouse_code: ['EAST', 'WEST']).group(:warehouse_code).sum(:stock)
    @total_stock_east = warehouse_stock['EAST'] || 0
    @total_stock_west = warehouse_stock['WEST'] || 0
    @stock_status = SoukoZaiko.select(:sku_code).group(:sku_code).sum(:stock)
    @prefecture_codes = PrefectureCode.select(:code, :name, :ew_flag)
    @recent_items = SoukoZaiko.order(created_at: :desc).limit(5).select(:id, :sku_code, :warehouse_code, :stock)
  end
end
