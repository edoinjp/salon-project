class BookingsController < ApplicationController
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
    @booking = current_user.bookings.Build(booking_params)
    if @booking.save
      redirect_to @booking, notice:`booking was succesfully created`
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
end
