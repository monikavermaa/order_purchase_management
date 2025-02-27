# app/controllers/orders_controller.rb
class OrdersController < ApplicationController

	def new
		@order = Order.new
		@order.order_items.build # Initializes one order_item
	end

  def postal_code_search 
    address = PostalCodeService.get_address(params[:zipcode])
    render json: address
  end   
	
  def create
    @order = Order.new(order_params)
    # Look up the prefecture to get East/West flag
    prefecture = PrefectureCode.find_by(name: @order.delivery_state)
    
    if prefecture.nil?
      # If the prefecture is not found, redirect with an alert
      redirect_to new_order_path, alert: "Invalid state name"
    else
      east_west_flag = prefecture.ew_flag
      ActiveRecord::Base.transaction do
        # Deduct stock from souko_zaiko based on East/West flag
        @order.order_items.each do |item|
          souko_zaiko = SoukoZaiko.find_by(sku_code: item.sku_code, prefecture_code_id: prefecture.id)
          
          if souko_zaiko.nil?
            # If souko_zaiko is not found, rollback the transaction
            raise ActiveRecord::Rollback, "SoukoZaiko record not found for sku_code #{item.sku_code} and prefecture_code_id #{prefecture.id}"
          end
          
          # Deduct stock from the souko_zaiko
          souko_zaiko.update!(stock: souko_zaiko.stock - item.quantity) # Using update! to raise an exception if fails
          
          # Create a new SoukoZaiko entry with the updated stock and other details
          SoukoZaiko.create!(warehouse_code: east_west_flag, sku_code: item.sku_code, stock_type: "02", stock: item.quantity, prefecture_code_id: prefecture.id)
        end
  
        # Update order attributes
        @order.user_id = current_user.id
        @order.order_number = SecureRandom.hex(8) # Generate a random order number
        @order.total_amount = @order.order_items.sum { |item| item.price * item.quantity }
        @order.tax = @order.order_items.sum(:total_amount) * 0.08
        @order.total_amount += @order.tax
  
        # Save the order
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
  