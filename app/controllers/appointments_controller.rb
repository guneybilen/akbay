class AppointmentsController < ApplicationController

  before_action :set_i18n, only: [:index, :new, :create, :new]

  def index
    redirect_to new_appointment_path
  end

  def new
    # @lang = params[:locale]
    # I18n.locale = @lang.to_sym
    @appointment = Appointment.new
  end


  def create
    @lang = params[:lang]
    @appointment = Appointment.new(params_permit1)
    if @appointment.save
      redirect_to @appointment
      Office.mail_office(@appointment).deliver
    else
      flash.now[:error] = I18n.t("err")
      render 'new'
    end

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

  private
    def set_i18n
      @lang = params[:locale]
      I18n.locale = @lang.to_sym
    end
end
