class UsersController < ApplicationController


  # in the create method we create a new instance variable which is passed through the params a user enters,
  # then we insert some logic to create an authentication token (JWT) with knock. 
  def create
    @user = User.create(user_params)

    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {first_name: @user.first_name, jwt: auth_token.token}, status: :created
    else 
      render json: @user.errors, status: :unprocessable_entity
    end 
  end
  

  # this doesn't create a user, but finds one that exists - i.e. find by the params passed in for email and password.
  #then we have added additional logic, if a user has this email in the DB, then we can authenticate them with .authenticate from bcrypt.
  def sign_in
    @user = User.find_by_email(params[:auth][:email])
    if @user and @user.authenticate(params[:auth][:password])
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {first_name: @user.first_name, jwt: auth_token.token}, status: 200
    else
      render json: {error: "incorrect details entered for password or username"}, status: 404
    end
  end 

  # params are the attributes that the client passes to the server when a user is created for instance, thus we need 
  # to specify what can be passed with permit and require, and define the information that will be passed into the create method.
  private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end
  
end
