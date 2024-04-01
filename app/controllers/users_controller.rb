class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def show
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # User successfully created
      redirect_to root_path, notice: 'User was successfully created.'
    else
      # Validation failed, render the new user form again
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :phone_number)
  end

end
