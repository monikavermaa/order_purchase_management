# spec/controllers/orders_controller_spec.rb
require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a user factory
  let(:prefecture) { create(:prefecture_code, name: '北海道', ew_flag: '東') } # Adjust as needed
  let(:sku) { create(:sku) } # Assuming you have an SKU factory

  before do
    sign_in user # Assuming you're using Devise for authentication
  end

  describe 'POST #create' do
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
              { sku_code: sku.code, quantity: 2, price: 100 }
            ]
          }
        }
      end

      it 'creates a new order' do
        expect {
          post :create, params: valid_attributes
        }.to change(Order, :count).by(1)
      end

      it 'creates associated order items' do
        expect {
          post :create, params: valid_attributes
        }.to change(OrderItem, :count).by(1)
      end

      it 'deducts stock from souko_zaiko' do
        expect {
          post :create, params: valid_attributes
        }.to change { SoukoZaiko.find_by(sku_code: sku.code, prefecture_code_id: prefecture.id).stock }.by(-2)
      end

      it 'redirects to the new order' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(Order.last)
      end

      it 'sets a success notice' do
        post :create, params: valid_attributes
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
          post :create, params: invalid_attributes
        }.to_not change(Order, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end
end
