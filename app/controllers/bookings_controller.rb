class BookingsController < ApplicationController
 before_action :authenticate_user!
 skip_before_action :authenticate_user!, only: [ :show, :create]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @cat = Cat.find(params[:id])
    @booking = @cat.bookings.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
       render :new
     end
  end


  def booking_params
    params.require(:booking).permit(:user_id, :cat_id, :renting_price, :start_time, :end_time)
  end

  def destroy

  end


end
