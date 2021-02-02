class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :booking_params, only: [:create]
  
  def index
   bookings = Booking.all.map do | booking |
    {location: booking.location, date: booking.date, time: booking.time, service: booking.service.name, cost: booking.service.cost}
   end
   render json: bookings
  end

  def create
    booking = Booking.new(booking_params)
    if booking.save
      render status: :created
    else 
      render status: :unprocessable_entity
    end
  end

  def show
    render json: @booking
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(booking_params[:id])
  end

  def booking_params
    params.require(:booking).permit(:location, :date, :time, :service, :employee)
  end

end
