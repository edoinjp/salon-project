class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  # Show action to display user details
  def show
    # Uncomment the line below if you want to find a specific user by their ID
    # @user = User.find(params[:id])
  end

  # New action to create a new user
  def new
    @user = User.new
  end

  # Create action to save a new user to the database
  def create
    @user = User.new(user_params)
    if @user.save
      # User successfully created, redirect to root path with a success notice
      redirect_to root_path, notice: 'User was successfully created.'
    else
      # Validation failed, render the new user form again to display errors
      render :new
    end
  end

  # Edit action (empty for now, can be implemented later if needed)
  def edit
  end

  # Update action (empty for now, can be implemented later if needed)
  def update
  end

  private

  # Strong parameters for user creation
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :phone_number)
  end
end
