class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render json: {user: current_user}, status: :ok #added in status::ok 3:30 7/2/21
  end 
end
