class BookingsController < ApplicationController
  before_action :authenticate_user, only: [:current]
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
    booking = Booking.find(booking_params[:id])
    render json: booking
  end

  def destroy
    booking.destroy
  end

  def current
    current_booking = current_user.bookings.last
    service = current_booking.service
    render json: { 
      location: current_booking.location,
      time: current_booking.time,
      date: current_booking.date,
      name: service.name,
      cost: service.cost
    }
  end

  private

  def set_booking
    @booking = Booking.find(booking_params[:id])
  end

  def booking_params
    params.require(:booking).permit(:location, :date, :time, :service)
  end

end
