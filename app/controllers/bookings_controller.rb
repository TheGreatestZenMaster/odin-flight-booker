class BookingsController < ApplicationController
    before_action :user_logged_in?, only: [:new]
    
    def new
        @user = current_user
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
        @user = current_user
        @flight_id = params[:booking][:flight_id]
        @booking = Booking.create!(flight_id: @flight_id, user_id: session[:user_id])
        params[:booking][:passengers_attributes].each do |key, hash|
           @booking.passengers.create!(name: params[:booking][:passengers_attributes][key][:name])
        end
        UserMailer.flight_confirmation_email(@user).deliver_now
        redirect_to booking_path(@booking.id)
    end
    
    
    private
    
        def passenger_params
            params.require(:booking).permit(:name)
        end
        
        def user_logged_in?
            unless logged_in?
                store_location
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end

end
