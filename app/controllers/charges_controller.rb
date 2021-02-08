class ChargesController < ApplicationController

  # Create here "creates" a stripe session and allows payments to be made - will render a success or failure page depending on 
  def create
    
    # finds the correct booking and stores it in variable
    booking = Booking.find(params[:id])

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          # props from individual booking ids passed here, found through line 6
          unit_amount: booking.service.cost * 100,
          currency: 'aud',
          product_data: {
            name: 'Flex Physio',
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: "http://localhost:8080/success",
      cancel_url: "http://localhost:8080/cancel",
    })
    render json: { id: session.id }, status: :ok #added status ok in for testing 3pm 7/2/21
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
