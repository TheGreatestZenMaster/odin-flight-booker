class FlightsController < ApplicationController
    def index
        @flight = Flight.new()
        @airport_options = Airport.all.collect { |airport| [airport.name, airport.id] }
        @time_options = Flight.all.collect { |flight| [flight.time.strftime("%d/%m/%Y"), flight.time] }
        @time_options.uniq!(&:first)
        unless params[:flight].nil?
            @booking = Booking.new()
            @number_of_passengers = params[:flight][:booking][:num_of_tickets].to_i
            @flights = Flight.where(departing_airport_id: params[:flight][:departing_airport_id], 
                                        arriving_airport_id: params[:flight][:arriving_airport_id])
            @flight_options = @flights.collect do |flight| 
                date = params[:flight][:time].to_time.strftime("%d/%m/%Y")
                if flight.time.strftime("%d/%m/%Y") == date
                    flight
                end
            end
            @flight_options.compact!
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
