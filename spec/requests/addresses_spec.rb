require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe "POST addresses#create" do
    context 'when the address is valid' do
      before(:example) do
        @address_params = FactoryBot.attributes_for(:address)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Address to the database' do
        expect(Address.last.street).to eq(@address_params[:street])
      end
    end

    context 'when the Address is invalid' do
      before(:example) do
        @address_params = FactoryBot.attributes_for(:address, :invalid)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
      end
      
      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT addresses#update" do 
    context 'when the address is updated' do
      before(:example) do
        @address_params = FactoryBot.attributes_for(:address)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
        @id = Address.last.user_id
      end

      it 'returns ok status of 200' do
        @update_address_params = FactoryBot.attributes_for(:address, :update)
        put "/api/update-address/#{@id}", params: { address: @update_address_params }, headers: authenticated_header
        expect(response.status).to eq(200)
      end
    end

    context 'when the Address update details are invalid' do
      # create an address
      before(:example) do
        @address_params = FactoryBot.attributes_for(:address)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
        @id = Address.last.user_id
        @update_address_params = FactoryBot.attributes_for(:address, :invalid)
        put "/api/update-address/#{@id}", params: { address: @update_address_params }, headers: authenticated_header
      end
      
      it 'returns unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET addresses#show" do
    context 'returns the selected address' do
      before(:example) do
        @address_params = FactoryBot.attributes_for(:address)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
        @id = User.last.id
      end
      
      it 'returns ok status of 200' do
        get "/api/addresses/#{@id}", params: { address: @address_params }, headers: authenticated_header
        expect(response.status).to eq(200)
      end

    end
  end
end