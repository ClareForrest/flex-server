class EmployeesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]
  # before_action :authorise_user
  before_action :set_employee, only: [:show, :destroy]

  def index
    employees = Employee.all.map do |employee|
      {first_name: employee.user.first_name, last_name: employee.user.last_name, availability: employee.availability}
    end
    render json: employees
  end

  def show
    render json: @employee
  end
  # this method is to enable employee-users to set their availability - which will populate sessions that non-employee users can select to book sessions
  def create
    employee = Employee.new(employee_params)
    employee.user_id = current_user.id
    if employee.save 
      render status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def update
    @employee = Employee.find params[:id]
    if @employee.update(employee_params)
      render status: :ok 
    else 
      render status: :bad_request
    end 
  end 

  # this method allows employee-users to delete availability slots, where their circumstances change - thus altering available times. 
  def destroy
    @employee.destroy
    render status: :ok #I think i need this to for tests.
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:user_id, :availability)
  end 

  # this will limit the use of the functionality of this file to users who are also employees
  
  # def authorise_user
  #   unless user.employee
  #     render status: 401
  #   end 
  # end
end
