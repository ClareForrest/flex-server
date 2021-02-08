class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    @users = User.all
  end

  # in the create method we create a new instance variable which is passed through the params a user enters,
  # then we insert some logic to create an authentication token (JWT) with knock.
  def create
    @user = User.new(user_params)

    if @user.save
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { first_name: @user.first_name, jwt: auth_token.token }, status: :created
      
      UserNotifierMailer.send_signup_email(@user).deliver
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: @user
  end

  def update
    if @user.update(user_params)
      render status: :ok
    else
      render status: :bad_request
    end
  end

  # this doesn't create a user, but finds one that exists - i.e. find by the params passed in for email and password.
  # then we have added additional logic, if a user has this email in the DB, then we can authenticate them with .authenticate from bcrypt.
  def sign_in
    @user = User.find_by_email(params[:auth][:email])
    if @user && @user.authenticate(params[:auth][:password])
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { first_name: @user.first_name, jwt: auth_token.token }, status: 200
    else
      render json: { error: 'incorrect details entered for password or username' }, status: 404
    end
  end

  # params are the attributes that the client passes to the server when a user is created for instance, thus we need
  # to specify what can be passed with permit and require, and define the information that will be passed into the create method.
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end
end
