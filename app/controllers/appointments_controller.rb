class AppointmentsController < ApplicationController

  def index
    lang = params[:lang]
    I18n.locale = lang.to_sym
    @appointment = Appointment.new
    render :new
  end
end
