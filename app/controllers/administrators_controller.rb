class AdministratorsController < ApplicationController
  before_action :authenticate_administrator!

  def index
    # You may implement this action if needed
  end


  def show
    @administrator = current_administrator
    # Uncomment this line if you want to show all bookings
    # @bookings = Booking.all
    # Keep this line if you want to show bookings associated with the current administrator
    @bookings = @administrator.bookings
  end

  def update
    @administrator = current_administrator
    @booking = @administrator.bookings.find(params[:id])
    if @booking.update(booking_params)
      redirect_to administrator_path(@administrator), notice: 'Booking status updated successfully.'
    else
      render :show
    end
  end

  def accept_booking
    render_404 unless valid_booking?

    @administrator = Administrator.find(params[:administrator_id])
    @booking = Booking.find(params[:booking_id])

    @booking.update(booking_status: 'Accepted')
    redirect_back(fallback_location: root_path)
  end

  def decline_booking
    @administrator = Administrator.find(params[:administrator_id])

    @booking = Booking.find(params[:booking_id])
    @booking.update(booking_status: 'Declined')
    redirect_back(fallback_location: root_path)
  end


  private

  def booking_params
    # Permit any other necessary parameters here
    params.require(:booking).permit(:status)
  end
end
