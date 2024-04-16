class BookingsController < ApplicationController
  # before_action :authenticate_user! # Uncomment this line if you want to authenticate users before accessing controller actions

  # Dashboard action for users
  def dashboard
    @bookings = Booking.all
    # Uncomment the line below if you want to find a specific booking by its ID
    # @booking = Booking.find(params[:id])
  end

  # Index action to display all bookings for the current user
  def index
    @bookings = current_user.bookings
  end

  # Show action to display details of a specific booking
  def show
    @booking = Booking.find(params[:id])
  end

  # New action to create a new booking
  def new
    # Uncomment the line below if you want to find a specific service by its ID
    # @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  # Create action to save a new booking to the database
  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.administrator_id = Administrator.first.id
    @booking.booking_status = 'pending'

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created'
    else
      render :new
    end
  end

  # Edit action to edit an existing booking
  def edit
    @booking = Booking.find(params[:id])
  end

  # Update action to update an existing booking in the database
  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated'
    else
      render :edit
    end
  end

  # Destroy action to delete an existing booking from the database
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  # Action to update the status of a booking (for administrators)
  def update_status
    @booking = Booking.find(params[:id])
    new_status = params[:status]

    if new_status == 'accepted' || new_status == 'rejected'
      @booking.update(booking_status: new_status)
      redirect_to admin_dashboard_path, notice: 'Booking status updated successfully.'
    else
      redirect_to admin_dashboard_path, alert: 'Invalid status.'
    end
  end

  private

  # Strong parameters for booking creation and updating
  def booking_params
    params.require(:booking).permit(:booking_date, :service_id, :administrator_id)
  end
end
