class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :service_params, only: [:create]

  def create
    service = Service.new(service_params)
    if service.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def show
    render json: @service
  end

  private
  
  def set_service
    # @service = Service.find(booking_params[:id]) #initially what we had
    @service = Service.find(params[:id]) #what Eddie told me to change it to
  end

  def service_params
    params.require(:service).permit(:name, :cost)
  end

end
