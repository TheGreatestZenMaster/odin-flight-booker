class FlightsController < ApplicationController
    def index
        @flight = Flight.new()
        if params[:flight].nil?
            @airport_options = Airport.all.collect { |airport| [airport.name, airport.id] }
        else
            @number_of_passengers = params[:flight][:booking][:num_of_tickets]
            @booking = Booking.new()
            @flights = Flight.where(departing_airport_id: params[:flight][:departing_airport_id], 
                                        arriving_airport_id: params[:flight][:arriving_airport_id])
            @flight_options = @flights.map { |flight| [flight.time.to_s(:time), flight.id] }
        end
    end
    
    def show
        @flight = Flight.find(params[:id])
    end
    
    private
        def flight_params
           params.require(:flight).permit(:flight => [:departing_airport_id, :arriving_airport_id]) 
        end
end
