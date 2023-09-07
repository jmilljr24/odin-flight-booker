class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    @search = params['search']
    return unless @search.present?

    @name = @search['name']
    @airport = Airport.find_by(city: @name)
    @flights = @airport.departing_flights
  end
end
