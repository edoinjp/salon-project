
class BookingsController < ApplicationController
  # before_action :authenticate_user!

  def dashboard
    @bookings = Booking.all
    # @booking = Booking.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.administrator_id = Administrator.first.id

    @booking.booking_status = 'pending'

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created'
    else
      render :new
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end



  def approve
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: 'approved')
    redirect_to admin_dashboard_path, notice: 'Booking approved successfully'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: 'declined')
    redirect_to admin_dashboard_path, notice: 'Booking declined successfully'
  end



  private
  def next_available_administrator
    # Get all administrators who are not currently assigned a booking
    available_administrators = Administrator.where.not(id: Booking.where.not(administrator_id: nil).select(:administrator_id))

    # If there are no available administrators, fallback to the first administrator
    available_administrators.present? ? available_administrators.first.id : Administrator.first.id
  end

  def booking_params
    params.require(:booking).permit(:booking_date, :service_id, :administrator_id)
  end
end
