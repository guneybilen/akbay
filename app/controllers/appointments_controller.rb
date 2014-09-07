class AppointmentsController < ApplicationController

  def index
    @lang = params[:lang]
    I18n.locale = @lang.to_sym

    redirect_to new_appointment_path
  end

  def new
    @appointment = Appointment.new
  end


  def create
    @appointment = Appointment.create(params_permit1)
    @lang = params[:lang]
    Office.mail_office(@appointment).deliver
    redirect_to @appointment
  end

  def show

  end

  def webmaster
    params_permit2
    email = params[:email]
    message = params[:message]
    Webmaster.mail_webmaster(email, message).deliver
  end


  def params_permit1
    params.require(:appointment).permit(:firstname, :lastname, :email, :phone, :comments,
                  :complaints, :humanizer_answer, :humanizer_question_id, :lcl, date: [], time: [])
  end

  def params_permit2
    params.permit(:email, :message)
  end
end
