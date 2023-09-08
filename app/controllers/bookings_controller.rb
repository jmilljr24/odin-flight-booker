class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    @num_passengers = params[:num_passengers]
    @passengers = @booking.passengers.build
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.create(booking_params)
    # @booking.flight = @flight
    # @passengers = @booking.passengers
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show # fix
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
