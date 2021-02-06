require "rails_helper"

RSpec.describe "routes for Employees", :type => :routing do
  it "routes /api/availabilities to the Employees index controller" do
    expect(get("/api/availabilities")).
      to route_to("employees#index")
  end

  it "routes /api/new to the Employees create controller" do
    expect(post("/api/new")).
      to route_to("employees#create")
  end

  it "routes /api/employees to the Employees index controller" do
    expect(get("/api/availabilities")).
      to route_to("employees#index")
  end

  # it "routes /api/availability/:id to the Employees show controller" do
  #   expect(get("/api/availability/:id")).
  #     to route_to("employees#show")
  # end
end