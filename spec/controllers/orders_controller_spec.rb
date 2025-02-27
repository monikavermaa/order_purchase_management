# spec/requests/orders_spec.rb
require 'rails_helper'

RSpec.describe "Orders", type: :request do
  include Devise::Test::IntegrationHelpers # This line adds the Devise helpers

  #let(:user) { create(:user) }  # Assuming you have a user factory
	let(:user) { create(:user, email: 'user@example.com', password: 'password123') }
  let(:prefecture) { create(:prefecture_code, name: '北海道', ew_flag: '東') }  # Adjust as needed
  let!(:sku) { create(:souko_zaiko) } # Assuming you have an SKU factory

	before do
		# debugger
		user.email == 'user@example.com'
		user.password == 'password123'
   # sign_in user  # This will now work because of the inclusion above
  end

  describe 'POST /orders' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          order: {
            delivery_zipcode: '462030',
            delivery_state: '北海道',
            delivery_city: 'Addf',
            delivery_area: 'Abdf',
            delivery_address: 'Abc, addreass, swwqer',
            order_items_attributes: [
              { sku_code: sku.sku_code, quantity: 2, price: 100 }
            ]
          }
        }
      end

      it 'creates a new order' do
        expect {
          post orders_path, params: valid_attributes
        }.to change(Order, :count).by(1)
      end

      it 'creates associated order items' do
        expect {
          post orders_path, params: valid_attributes
        }.to change(OrderItem, :count).by(1)
      end

      it 'deducts stock from souko_zaiko' do
        expect {
          post orders_path, params: valid_attributes
        }.to change { SoukoZaiko.find_by(sku_code: sku.sku_code).stock }.by(-2)
      end

      it 'redirects to the new order' do
        post orders_path, params: valid_attributes
        expect(response).to redirect_to(Order.last)
      end

      it 'sets a success notice' do
        post orders_path, params: valid_attributes
        follow_redirect!
        expect(flash[:notice]).to eq('Order created successfully.')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          order: {
            delivery_zipcode: '',
            delivery_state: '',
            delivery_city: '',
            delivery_area: '',
            delivery_address: '',
            order_items_attributes: []
          }
        }
      end

      it 'does not create a new order' do
        expect {
          post orders_path, params: invalid_attributes
        }.to_not change(Order, :count)
      end

      it 'renders the new template' do
        post orders_path, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
end
