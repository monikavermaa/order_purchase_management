# app/controllers/orders_controller.rb
class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.order_items.build
    @available_skus = SoukoZaiko.where("stock > ?", 0).pluck(:sku_code).uniq
  end

  def postal_code_search 
    address = PostalCodeService.get_address(params[:zipcode])
    render json: address
  end   

  def create
    @order = Order.new(order_params)
    prefecture = PrefectureCode.find_by(name: @order.delivery_state)

    if prefecture.nil?
      redirect_to new_order_path, alert: "Invalid state name"
    else
      ActiveRecord::Base.transaction do
        @order.order_items.each do |item|
          souko_zaiko = SoukoZaiko.find_by(sku_code: item.sku_code, prefecture_code_id: prefecture.id)
          if souko_zaiko.nil?
            raise ActiveRecord::Rollback, "SoukoZaiko record not found for sku_code #{item.sku_code} and prefecture_code_id #{prefecture.id}"
          end
          souko_zaiko.update!(stock: souko_zaiko.stock - item.quantity)
        end

        @order.user_id = current_user.id
        @order.order_number = SecureRandom.hex(8)
        @order.total_amount = @order.order_items.sum { |item| item.price * item.quantity }
        @order.tax = @order.order_items.sum(:total_amount) * 0.08
        @order.total_amount += @order.tax

        if @order.save
          redirect_to @order, notice: "Order created successfully."
        else
          raise ActiveRecord::Rollback, "Failed to save the order"
        end
      end
    end
  end

  def show 
    @order = Order.find(params[:id])
  end 

  private

  def order_params
    params.require(:order).permit(:delivery_zipcode, :delivery_state, :delivery_city, :delivery_area, :delivery_address, :tax, order_items_attributes: [:id, :sku_code, :quantity, :price])
  end
end
