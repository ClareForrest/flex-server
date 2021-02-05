require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET employees#index" do
    before(:example) do
      @first_employee = FactoryBot.create(:employee)
      @second_employee = FactoryBot.create(:employee)
      get employees_path, headers: authenticated_header
      @json_response = JSON.parse(response.body)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'address contains expected attributes' do
      expect(@json_response.first).to include({
        'availability' => @first_employee.availability
      })
    end

  describe 'POST employees#create' do
    context 'when the employee is valid' do
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee)
        post new_path, params: { employee: @employee_params}, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Employee to the database' do
        expect(Employee.last.availability).to eq(@employee_params[:availability])
      end

      context 'when the employee is invalid' do
        before(:example) do
          @employee_params = FactoryBot.attributes_for(:employee, :invalid)
          post employees_path, params: { employee: @employee_params}, headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end

        it 'returns http unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns the correct number of errors' do
          expect(@json_response['errors'].count).to eq(1)
        end

        it 'errors contains the correct error message' do
          expect(@json_response['errors'].first).to eq("First_name can't be blank")
        end

        end
      end
    end
  end
end
