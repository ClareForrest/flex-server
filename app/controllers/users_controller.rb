class UsersController < ApplicationController


  def create
    @user = User.create(user_params)

    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {first_name: @user.first_name, jwt: auth_token.token}, status: :created
    else 
      render json: @user.errors, status: :unprocessable_entity
    end 
  end
  

  # params are the attributes that the client passes to the server when a user is created for instance, thus we need 
  # to specify what can be passed with permit and require, and define the information that will be passed into the create method.
  private 
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end
  
end
