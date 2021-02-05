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

      context 'when the Address is invalid' do
        before(:example) do
          @address_params = FactoryBot.attributes_for(:address, :invalid)
          post addresses_path, params: { address: @address_params }, headers: authenticated_header
          p @address_params
          @json_response = JSON.parse(response.body)
        end
        
        # it 'returns http unprocessable entity' do
        #   expect(response).to have_http_status(:unprocessable_entity)
        # end

        # it 'returns the correct number of errors' do
        #   expect(@json_response['errors'].count).to eq(1)
        # end

        # it 'errors contains the correct error message' do
        #   expect(@json_response['errors'].first).to eq("Street can't be blank")
        # end
      end
    end
  end
end