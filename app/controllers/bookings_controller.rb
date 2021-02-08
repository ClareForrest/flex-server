class BookingsController < ApplicationController
  before_action :authenticate_user, only: [:current]
  before_action :set_booking, only: [:show]
  before_action :booking_params, only: [:create]
  
  def index
   bookings = Booking.all.map do | booking |
    {location: booking.location, date: booking.date, time: booking.time, service: booking.service.name, cost: booking.service.cost}
   end
   render json: bookings
  end

  def create
    service = Service.find_by_name(params[:booking][:service]) #took out .capitalize with Eddie. tests pass now
    booking = Booking.new(booking_params)
    booking.service_id = service.id
    booking.user_id = current_user.id
    if booking.save
      render status: :created

      BookingNotifierMailer.send_booking_email(current_user).deliver
    else 
      render status: :unprocessable_entity
    end
  end

  def show
    booking = Booking.find(booking_params[:id])
    render json: booking
  end

  def destroy
    current_booking = current_user.bookings.last
    current_booking.destroy
    render status: :ok
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
    @booking = Booking.find(params[:id]) #was (booking_params[:id]) changed with Eddie
  end

  def booking_params
    params.require(:booking).permit(:location, :date, :time)
  end

end
