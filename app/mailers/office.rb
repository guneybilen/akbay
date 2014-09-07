class Office < ActionMailer::Base
  # default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.office.mail_office.subject
  #
  def mail_office(appointment = {})
    @firstname = appointment[:firstname]
    @lastname = appointment[:lastname]
    @email = appointment[:email]
    @comment = appointment[:comment]
    @complaint = appointment[:complaint]
    @date = appointment[:date]
    @time = appointment[:time]

    mail :to => "guneybilen@yahoo.com", :subject => "#{@firstname} #{@lastname} - #{@email}" , :from =>  "admin@isgetir.com"

  end
end
