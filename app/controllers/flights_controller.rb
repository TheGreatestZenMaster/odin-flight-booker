class FlightsController < ApplicationController
    def index
        @airport = Airport.new()
        @flights = Flight.all
        if params[:airport].nil?
            @airport_options = Airport.all.map{ |airport| [airport.name, airport.code] }
        else
            @airport = Airport.find_by(code: params[:airport][:code])
            id = @airport.id
            @flights = Flight.where(departing_airport_id: id)
        end
    end
    
    def show
        
    end
    
    def flight_params
        unless params[:flight_choice].nil?
            params.require(:flight_choice).permit() 
        end
    end
end
