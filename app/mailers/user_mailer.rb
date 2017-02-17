class UserMailer < ApplicationMailer
    default from: "notification@example.com"
    
    def flight_confirmation_email(user)
        @user = user
        @booking = @user.bookings.last
        @url = ' '
        mail(to: @user.email, subject: "Thank you for booking with us!")
    end
end
