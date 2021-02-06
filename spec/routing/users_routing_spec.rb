require "rails_helper"

RSpec.describe "routes for Users", :type => :routing do
  it "routes /api/sign-up to the Users create controller" do
    expect(post("/api/sign-up")).
      to route_to("users#create")
  end
  
  it "routes /api/sign-in to the Users sign_in controller" do
    expect(post("/api/sign-in")).
    to route_to("users#sign_in")
  end
  
  # context 'when logged in, individual users details are used in routing' do
  #   before(:example) do
  #     @user1 = FactoryBot.create(:user)
  #     get sign_up_path
  #   end

  #   it "routes /api/profile to the Users show controller" do
  #     expect(get("/api/profile/:id")).
  #       to route_to("users#show")
  #   end
  
    # it "routes /api/update-profile to the Users update controller" do
    #   expect(put("/api/update-profile/:id")).
    #     to route_to("users#update")
    # end

  # end
end