class EmployeesController < ApplicationController
  # before_action :authenticate_user
  # before_action :authorise_user 


  # this method is to enable employee-users to set their availability - which will populate sessions that non-employee users can select to book sessions
  def create
    employee = Employee.new(employee_params)
    employee.user_id = current_user.id
    if employee.save 
      render status: :created
    else
    render status: :unprocessable_entity
    end 
  end

  def index
    @employees = Employee.all
    render json: @employees
  end

  def show
    render json: @employee
  end

  # this method allows employee-users to delete availability slots, where their circumstances change - thus altering available times. 
  def destroy
    @employee.destroy 
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:availability)
  end 

  # this will limit the use of the functionality of this file to users who are also employees
  
  # def authorise_user
  #   if !user.employee
  #     render status: 401
  #   end 
  # end
end
