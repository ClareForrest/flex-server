class AddressesController < ApplicationController
  before_action :set_address, only: [:update]

  # allows users to create a new address and populate the db table with this information
  def create
    address = Address.create(address_params)
    address.user_id = current_user.id
    if address.save 
      render status: :created
    else
      render status: :unprocessable_entity
    end 
  end 

  # allows users to show their individual address information based on their user id
  def show
    user = User.find(params[:id])
    render json: user.address
  end

  # allows users to update address information
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

  # defines the permitted parameters that can be inputted
  def address_params
    params.require(:address).permit(:street, :suburb, :state, :postcode)
  end 
  
end

