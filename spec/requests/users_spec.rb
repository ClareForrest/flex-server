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

    describe 'POST users#create' do
      context 'when the User is valid' do
        before(:example) do
          @user = FactoryBot.attributes_for(:user)
          post sign_up_path, params: { user: @user_params }, headers: authenticated_header
        end
  
        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end
  
        it 'saves the User to the database' do
          expect(User.last.first_name).to eq(@user_params[:first_name])
        end
  
        context 'when the User is invalid' do
          before(:example) do
            @user_params = FactoryBot.attributes_for(:user, :invalid)
            post sign_up_path, params: { user: @user_params }, headers: authenticated_header
            @json_response = JSON.parse(response.body)
          end
  
          it 'returns http unprocessable entity' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
  
          it 'returns the correct number of errors' do
            expect(@json_response['errors'].count).to eq(1)
          end
  
          it 'errors contains the correct error message' do
            expect(@json_response['errors'].first).to eq("First Name can't be blank")
          end
  
          end
        end
      end
  end
end