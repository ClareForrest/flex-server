require 'rails_helper'

RSpec.describe "Services", type: :request do
  describe "POST services#create" do
    context 'when the address is valid' do
      before(:example) do
        @address_params = FactoryBot.attributes_for(:service)
        post addresses_path, params: { address: @address_params }, headers: authenticated_header
      end

      # it 'returns http success' do
      #   expect(response).to have_http_status(:success)
      # end

    end
  end
end