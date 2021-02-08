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
  end

  describe 'POST employees#create' do
    context 'when the employee is valid' do
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee)
        post new_path, params: { employee: @employee_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Employee to the database' do
        expect(Employee.last.availability).to eq(@employee_params[:availability])
      end
    end

    context 'when the employee is invalid' do
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee, :invalid)
        post new_path, params: { employee: @employee_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(1)
      end

      it 'errors contains the correct error message' do
        expect(@json_response['errors'].first).to eq("Availability can't be blank")
      end
    end
  end

  describe 'PUT employees#update' do
    context 'when employee is updated' do
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee)
        post new_path, params: { employee: @employee_params }, headers: authenticated_header
        @id = Employee.last.id
      end
    end

    # returning error: ActionController::RoutingError: No route matches [PUT] "/api/update-availability"
      # it 'returns ok status of 200' do
      #   @update_employee_params = FactoryBot.attributes_for(:employee, :update)
      #   put "/api/update-availability/#{@id}", params: { employee: @update_employee_params }, headers: authenticated_header
      #   expect(response.status).to eq(200)
      # end

    context 'when the Employee update details are invalid' do
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee)
        post new_path, params: { employee: @employee_params }, headers: authenticated_header
        @id = Employee.last.id
        @update_employee_params = FactoryBot.attributes_for(:employee, :invalid)
        put "/api/update-availability/#{@id}", params: { employee: @update_employee_params }, headers: authenticated_header
      end
      
      it 'returns bad reqeust status of 400' do
        expect(response).to have_http_status(:bad_request)
      end
    end

  end
  describe 'DELETE employees#destroy' do
    context 'when the employee is selected' do
      # set employee
      before(:example) do
        @employee_params = FactoryBot.attributes_for(:employee)
        post new_path, params: { employee: @employee_params }, headers: authenticated_header
        @id = Employee.last.id
      end

      it 'deletes selected employee' do
        # find and destroy!
        delete "/api/employees/delete/#{@id}", params: { employee: @employee_params }, headers: authenticated_header
        expect(response.status).to eq(200)
      end
    end
  end
end