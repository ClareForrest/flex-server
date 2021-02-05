require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET bookings#index" do
    before(:example) do
      @first_booking = FactoryBot.create(:booking)
      @second_booking = FactoryBot.create(:booking)
      get bookings_history_path, headers: authenticated_header
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

  # describe 'POST bookings#create' do
  #   context 'when the booking is valid' do
  #     before(:example) do
  #       @booking_params = FactoryBot.attributes_for(:booking)
  #       post bookings_new_path, params: { booking: @booking_params }, headers: authenticated_header
  #     end

  #     it 'returns http created' do
  #       expect(response).to have_http_status(:created)
  #     end

  #     it 'saves the Booking to the database' do
  #       expect(Booking.last.location).to eq(@booking_params[:location])
  #     end

  #     context 'when the Booking is invalid' do
  #       before(:example) do
  #         @booking_params = FactoryBot.attributes_for(:booking, :invalid)
  #         post bookings_new_path, params: { bookings: @bookings_params }, headers: authenticated_header
  #         @json_response = JSON.parse(response.body)
  #       end

  #       it 'returns http unprocessable entity' do
  #         expect(response).to have_http_status(:unprocessable_entity)
  #       end

  #       it 'returns the correct number of errors' do
  #         expect(@json_response['errors'].count).to eq(1)
  #       end

  #       it 'errors contains the correct error message' do
  #         expect(@json_response['errors'].first).to eq("Location can't be blank")
  #       end

  #       end
    #   end
    # end
  end
end