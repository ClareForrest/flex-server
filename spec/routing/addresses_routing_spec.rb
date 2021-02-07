require "rails_helper"

RSpec.describe "routes for Addresses", :type => :routing do
  it "routes /api/addresses to the Addresses create controller" do
    expect(post("/api/addresses")).
      to route_to("addresses#create")
  end

end