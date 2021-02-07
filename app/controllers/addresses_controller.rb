class AddressesController < ApplicationController
  before_action :set_address, only: [:update]

  def create
    address = Address.create(address_params)
    address.user_id = current_user.id
    if address.save 
      render status: :created
    else
      render status: :unprocessable_entity
    end 
  end 

  def show
    user = User.find(params[:id])
    render json: user.address
  end

  def update
    if @address.update(address_params)
      render status: :ok
    else
      render status: :unprocessable_entity #was :bad_request
    end
  end

  private 

  def set_address
    @address = Address.find(params[:id])
  end 

  def address_params
    params.require(:address).permit(:street, :suburb, :state, :postcode)
  end 
  
end

