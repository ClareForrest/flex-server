class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update]
  before_action :address_params, only: [:create]

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
  end

  private 

  def set_address
    @address = Address.find(params[:id])
  end 

  def address_params
    params.require(:address).permit(:street, :suburb, :state, :postcode)
  end 
  
end

