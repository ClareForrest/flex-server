require "rails_helper"

RSpec.describe StatusController, type: :request do
  describe "GET status#index" do
    context 'returns the current user'
    before(:example) do
      @user_params = FactoryBot.attributes_for(:user)
      get status_path, params: { status: @user_params }, headers: authenticated_header
      @id = User.last.id
    end

    it 'have http status of ok (200)' do
      expect(response).to have_http_status(:ok)
    end

  end
end