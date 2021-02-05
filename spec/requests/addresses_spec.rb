require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe "GET addresses#create" do
    # before(:example) do
    #   @first_address = FactoryBot.create(:address)
    #   # @second_address = FactoryBot.create(:address)
    #   get addresses_path
    #   @json_response = JSON.parse(response.body)
    # end

    # it 'returns http success' do
    #   expect(response).to have_http_status(:success)
    # end

    # it 'contains the correct number of entries' do
    #   expect(@json_response['addresses'].count).to eq(2)
    # end

    # it 'address contains expected attributes' do
    #   expect(@json_response['addresses'].first).to include({
    #     'id' => @first_address.id, 
    #     'user' => @first_address.user_id,
    #     'street' => @first_address.street,
    #     'suburb' => @first_address.suburb,
    #     'state' => @first_address.state,
    #     'postcode' => @first_address.postcode,
    #   })
    # end
  end
end
