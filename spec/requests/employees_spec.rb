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
  # describe 'DELETE employees#destroy' do
  #   context 'when the employee is selected' do
  #     before(:example) do
  #       @user1 = User.create(id: 1, first_name: "employee1", last_name: "lastname", password: '123456', email: 'test1@test.com', phone_number: '1234566789')
  #       p @user1.id
  #       @employee1 = Employee.create(user_id: @user1.id, availability: 'available', id: 1)
  #       # @employee2 = FactoryBot.attributes_for(:employee)
  #       # delete employees_delete_path, params: { employee: @employee_params }, headers: authenticated_header
  #       # p @employee_params
  #       delete "/api/employees/delete/#{@employee1.user_id}"
  #       p @employee1.user_id
  #       # @employee_params = FactoryBot.attributes_for(:employee)
  #       # @json_response = JSON.parse(response.body)
  #     end

  #     it 'expects selected employee to be deleted' do
  #       # expect(@employee1.user_id).to be(undef)
  #     end

  #   end
  # end
end