class AppointmentsController < ApplicationController

  def index
    lang = params[:lang]
    I18n.locale = lang.to_sym
    @appointment = Appointment.new
    render :new
  end

  def webmaster
    params_permit
    email = params[:email]
    message = params[:message]
    Webmaster.mail_webmaster(email, message).deliver
  end

  def params_permit
    params.permit(:email, :message)
  end
end
