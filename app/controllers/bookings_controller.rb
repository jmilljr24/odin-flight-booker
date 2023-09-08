class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flights = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers]
    # @booking.passengers.build
  end

  # def create
  #   @flight = Flight.find(booking_params[:flight_id])

  # end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
