require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST users#create" do
    context 'when the user is valid' do
      before(:example) do
        @user_params = FactoryBot.attributes_for(:user)
        post sign_up_path, params: { user: @user_params }
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the User to the database' do
        expect(User.last.first_name).to eq(@user_params[:first_name])
      end
    end
  end
end