class ReservationMailer < ActionMailer::Base
  default from: "admin@example.com"
  def reservation_notification(reservation)
  	@reservation = reservation
  	mail(to: @reservation.restaurant.user.email, subject: "Reservation Notification")
  end
end
