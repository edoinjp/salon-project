class AdministratorsController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_status_params)
      redirect_to administrators_path, notice: 'Booking status updated successfully.'
    else
      render :show
    end
  end

  private

  def booking_status_params
    params.require(:booking).permit(:status)
  end
end
