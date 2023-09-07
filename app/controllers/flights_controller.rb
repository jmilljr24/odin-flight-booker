class FlightsController < ApplicationController
  def index
    # @flights = Flight.where('DATE(departure) >= ?', Date.today)
    @dates = Flight.unique_departure_times
    @airport_options = Airport.all.map { |a| [a.city, a.id] }

    @departing_airport = params['depart']
    @arriving_airport = params['arrive']

    @flights = Flight.where(
      departure_airport_id: @departing_airport,
      arrival_airport_id: @arriving_airport
    )
  end
end
