require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "POST services#create" do
    context 'when the address is valid' do
      before(:example) do
        @service_params = FactoryBot.attributes_for(:service)
        post services_new_path, params: { service: @service_params}, headers: authenticated_header
     end

      it 'returns http success' do
        expect(response).to have_http_status(:created)
      end

    end

    context 'when the address is invalid' do
      before(:example) do
        @service_params = FactoryBot.attributes_for(:service, :invalid)
        post services_new_path, params: { service: @service_params}, headers: authenticated_header
     end

     it 'returns http unprocessable entity' do
       expect(response).to have_http_status(:unprocessable_entity)
     end
    end
  end

  describe "GET services#show" do
    context 'returns the selected service' do
      before(:example) do
        @service_params = FactoryBot.attributes_for(:service)
        post services_new_path, params: { service: @service_params }, headers: authenticated_header
        @id = Service.last.id
      end

      it 'returns ok status of 200' do
        get "/api/services/show/#{@id}", params: { service: @service_params }, headers: authenticated_header
        expect(response.status).to eq(200)
      end
    end
  end
end