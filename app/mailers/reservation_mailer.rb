class ReservationMailer < ApplicationMailer
  def reservation_booked_mail
    @reservation = params[:reservation]
    mail(to: @reservation.user.email,
         subject: 'You have booked a reservation!')
  end

  def reservation_updated_mail
    @reservation = params[:reservation]
    mail(to: @reservation.user.email,
         subject: 'You have updated your reservation!')
  end
end