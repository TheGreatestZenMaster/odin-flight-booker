class BookingsController < ApplicationController
    
    def new
        @flight_id = params[:flight][:id]
        @booking = Booking.new
        @number_of_passengers = params[:booking][:number_of_passengers].to_i
        @number_of_passengers.times do
            @booking.passengers.build()
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end
    
    def create
        @flight_id = params[:booking][:flight_id]
        @booking = Booking.create!(flight_id: @flight_id, user_id: 1)
        params[:booking][:passengers_attributes].each do |key, hash|
           @booking.passengers.create!(name: params[:booking][:passengers_attributes][key][:name])
        end
        redirect_to booking_path(@booking.id)
    end
    
    
    private
    
        def passenger_params
            params.require(:booking).permit(:name)
        end

end
