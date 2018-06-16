class ReservationMailer < ApplicationMailer
  def reservation_booked_mail
    @reservation = params[:reservation]
    @user = User.find(@reservation.user_id)
    mail(to: @user.email, subject: 'You have booked a reservation!')
  end
end