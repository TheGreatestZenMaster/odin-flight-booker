class FlightsController < ApplicationController
    def index
        
        if params[:flight_choice].nil?
            @flight_choice = Flight.new()
        else
            @airport_options = Airport.all.map{ |airport| [airport.name, airport.code] }
        end
    end
    
    def flight_params
        unless params[:flight_choice].nil?
            params.require(:flight_choice).permit() 
        end
    end
end
