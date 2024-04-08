
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
    @service = Service.find(params[:service_id])
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

  def booking_params
    params.require(:booking).permit(:booking_date, :service_id, :administrator_id)
  end
end
