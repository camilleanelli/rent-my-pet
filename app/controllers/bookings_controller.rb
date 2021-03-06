class BookingsController < ApplicationController
 before_action :authenticate_user!
 skip_before_action :authenticate_user!, only: [ :show, :create]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @cat = Cat.find(params[:cat_id])
    @booking = @cat.bookings.new(booking_params)
    @booking_total_price = @booking.duration * @cat.price
    @booking.renting_price = @booking_total_price
    @booking.renter = current_user
    if @booking.save
      redirect_to cat_booking_path(@cat, @booking)
    else
       render :new
     end
  end


  def booking_length

  end

   def total_price

    total = 0


    total
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :cat_id, :renting_price, :start_time, :end_time)
  end


end
