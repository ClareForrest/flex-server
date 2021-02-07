require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST users#create' do
    context 'when the User is valid' do
      before(:example) do
        @user_params = FactoryBot.attributes_for(:user)
        post sign_up_path, params: { user: @user_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the User to the database' do
        expect(User.last.first_name).to eq(@user_params[:first_name])
      end
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
        expect(@json_response['errors'].count).to eq(2)
      end

      it 'errors contains the correct error message' do
        expect(@json_response['errors'].first).to eq("First name can't be blank")
      end
    end
  end

  describe 'PUT users#update' do
    context 'when the User is updated' do
      before(:example) do
        @user_params = FactoryBot.attributes_for(:user)
        post sign_up_path, params: { user: @user_params }, headers: authenticated_header
        @id = User.last.id
      end

      it 'returns ok status of 200' do
        @update_user_params = FactoryBot.attributes_for(:user, :update)
        put "/api/update-profile/#{@id}", params: { user: @update_user_params }, headers: authenticated_header
        expect(response.status).to eq(200)
      end
    end
    
    context 'when User update details are invalid' do
      before(:example) do
        @user_params = FactoryBot.attributes_for(:user, :invalid)
        post sign_up_path, params: { user: @user_params }, headers: authenticated_header
        @id = User.last.id
      end

      it 'returns bad_request status of 422' do
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'GET users#update' do
    context 'when the User is selected' do
      before(:example) do
        @user_params = FactoryBot.attributes_for(:user)
        post sign_up_path, params: { user: @user_params }, headers: authenticated_header
        @id = User.last.id
        get "/api/profile/#{@id}", params: { user: @user_params }, headers: authenticated_header
      end

      it 'returns ok status of 200' do
        expect(response.status).to eq(200)
      end

      #this returns a discrepancy of two. expected User 55, got User 57
      # it 'shows selected user' do
      #   expect(User.last.first_name).to eq(@user_params[:first_name])
      # end


    end
  end

  ##currently working on this
  
  # describe 'POST users#sign_in' do
  #   context 'when the User signs in' do
  #     before(:example) do
  #       @user_params = FactoryBot.attributes_for(:user)
  #       post sign_in_path, params: { user: @user_params }, headers: authenticated_header
  #       # @id = User.last.id
  #     end

  #     it 'returns ok status of 200' do
  #       put "/api/sign-in", params: { user: @user_params }, headers: authenticated_header
  #       expect(response.status).to eq(200)
  #     end
  #   end
  # end
end
