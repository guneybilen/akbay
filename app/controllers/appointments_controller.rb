
=begin
when you scope a resource in routes:
 scope "/:locale" do
   resources :appointments
 end

you must put the following in the appointments controller
 def default_url_options(options={})
  { locale: I18n.locale }
 end

otherwise missing required keys: [:id] error occurs,
after you fill the form and submit
=end



class AppointmentsController < ApplicationController

  before_action :set_i18n, only: [:index, :new, :create, :new]
  # before_action :default_url_options, only: [:index, :new, :create, :new]
  # for default_url_options method before_action does not work

  def default_url_options(options={})
    if params[:locale]
     { locale: params[:locale] }
    else
      {}
    end
     # this method must return {} in else clause, otherwise error occurs
  end

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
    @appointment.change_humanizer_question(params[:appointment][:humanizer_question_id])
    if @appointment.save
      redirect_to @appointment
      Office.mail_office(@appointment).deliver
    else
      flash.now[:error] = I18n.t("err")
      render 'new'
    end

  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def webmaster
    params_permit2
    email = params[:email]
    message = params[:message]
    Webmaster.mail_webmaster(email, message).deliver
    render :nothing => true
  end


  def params_permit1
    params.require(:appointment).permit(:id, :firstname, :lastname, :email, :phone, :comments,
                  :complaints, :humanizer_answer, :humanizer_question_id, :date, :time, :bypass_humanizer)
  end

  def params_permit2
    params.permit(:email, :message)
  end

  def set_layout
    session["layout"] = (params[:mobile] == "1" ? "mobile" : "normal")
    puts "session[:layout]: " + session[:layout]
    redirect_to :controller => :countries, :action => "index"
  end

  private
    def set_i18n
      @lang = params[:locale]
      I18n.locale = @lang.to_sym
    end
end
