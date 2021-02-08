class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {user: current_user, is_employee: !!current_user.employee}, status: :ok
  end 
end
