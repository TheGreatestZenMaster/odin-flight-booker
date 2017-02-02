class BookingsController < ApplicationController
    
    def new
    end

    def create
        @booking = Booking.create(booking_params)
        @booking.save
        render booking_path(@booking.id)
    end
    
    def show
        @booking = Booking.find(params[:id])
    end
    
    def index
        @booking = Booking.new
        @flight_id = params[:booking][:flight_id]
        @number_of_passengers = params[:booking][:passengers].to_i
    end
    
    
    private
    
        def booking_params
            params.require(:booking).permit(:flight_id)
        end
        
end
