class BookingsController < ApplicationController
  def dashboard
    @bookings = Bookings.all
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
    redirect_to @booking, notice: `booking was succesfully updated`
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: `booking was succesfully deleted`
  end

  def approve
    booking = Booking.find(params[:id])
    booking.update(booking_status: 'approved')
     # Redirect or render appropriate response
  end

  def decline
    booking = Booking.find(params[:id])
    booking.update(booking_status: 'declined')
    # Redirect or render appropriate response
  end


  private

  def booking_params
    params.require(:booking).permit(:booking_date, :service_id, :administrator_id)
  end



end
