require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET bookings#index" do
    before(:example) do
      @first_booking = FactoryBot.create(:booking)
      @second_booking = FactoryBot.create(:booking)
      get bookings_history_path
      @json_response = JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'address contains expected attributes' do
      expect(@json_response.first).to include({
        'location' => @first_booking.location,
        'date' => @first_booking.date,
        'time' => @first_booking.time,
        'cost' => @first_booking.service.cost
      })
    end
  end
end
