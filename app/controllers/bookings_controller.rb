class BookingsController < ApplicationController
  before_action only:[:show, :destroy]
  
  def index
   bookings = Booking.all
  end

  def create
    booking = Booking.new
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
    params.require(:booking).permit(:location, :date, :time, :service)
  end

end
