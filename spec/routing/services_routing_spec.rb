require "rails_helper"

RSpec.describe ServicesController, type: :request do
  describe "GET service#index" do
    before(:example) do
      @service_params = FactoryBot.attributes_for(:service)
      post services_new_path, params: { service: @service_params}
    end
  end
end