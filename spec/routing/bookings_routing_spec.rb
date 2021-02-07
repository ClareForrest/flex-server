require "rails_helper"

RSpec.describe "routes for Bookings", :type => :routing do
  it "routes /api/bookings/history to the Bookings index controller" do
    expect(get("/api/bookings/history")).
      to route_to("bookings#index")
  end

  it "routes api/bookings/new to the Bookings create controller" do
    expect(post("/api/bookings/new")).
      to route_to("bookings#create")
  end

  it "routes api/bookings/current to the Bookings current controller" do
    expect(get("/api/bookings/current")).
      to route_to("bookings#current")
  end
  it "routes api/bookings/delete to the Bookings delete controller" do
    expect(delete("/api/bookings/delete")).
      to route_to("bookings#destroy")
  end

  # context 'when the user is unauthorised' do
  #   it "redirects to /login when unauthorised" do
  #     expect(get("/api/bookings/foo")).to have_http_status(:not_found)
  #   end
    
  # end
end