class UserMailer < ApplicationMailer
  default from: 'Recorrido reminder <price-alerts@recorrido.com>'

  def alert_email
    @user = params[:user]
    @tickets = params[:tickets]
    @alert = params[:alert]
    mail(to: @user.email, subject: 'Price alert!')
  end
end
