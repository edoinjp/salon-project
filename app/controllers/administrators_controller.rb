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


  private

  def booking_params
    # Permit any other necessary parameters here
    params.require(:booking).permit(:status)
  end
end
