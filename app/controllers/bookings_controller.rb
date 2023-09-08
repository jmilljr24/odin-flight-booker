class BookingsController < ApplicationController
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    @num_passengers = params[:num_passengers]
    # @num_passengers.times { @booking.passengers.build }
    @passengers = @booking.passengers.build
    @flight = Flight.find(params[:flight_id])
  end

  def create
    # @flight = Flight.find(params[:flight_id])
    # @booking = @flight.bookings.build(booking_params)
    @booking = Booking.create(booking_params)
    # @booking.flight = @flight
    # @passengers = @booking.passengers
    # @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
