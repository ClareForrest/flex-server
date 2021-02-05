class ChargesController < ApplicationController

  def create
    # finds the correct booking and stores it in variable
    
    # booking = Booking.find(params[:id])

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          unit_amount: booking.price,
          currency: 'aud',
          product_data: {
            name: 'Flex Physio',
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: "http://localhost:8080/success",
      cancel_url: "http://localhost:3000/cancel",
    })
    render json: { id: session.id }
  end

  def webhook
    payload = request.body.read
    puts payload.inspect
  end 

  def success
    @booking = Booking.find(params[:booking_id])
  end 

  def cancel
  end 

end
