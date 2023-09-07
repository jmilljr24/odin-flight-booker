class FlightsController < ApplicationController
  def index
    # @flights = Flight.where('DATE(departure) >= ?', Date.today)
    @dates = Flight.unique_departure_times
    @airport_options = Airport.all.map { |a| [a.city, a.id] }

    @departing_airport = params['depart']
    @arriving_airport = params['arrive']
    @date = params['date']

    # Takes selected departure date with midnight and gives range of whole day for search
    unless @date.blank?
      @time = Time.parse(@date)
      @start_time = Time.new(@time.year, @time.month, @time.day, 0, 0)
      @end_time = Time.new(@time.year, @time.month, @time.day, 11, 59)
    end

    @flights = Flight.where(
      departure_airport_id: @departing_airport,
      arrival_airport_id: @arriving_airport,
      departure: (@start_time..@end_time)
    )
  end
end
