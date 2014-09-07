class Webmaster < ActionMailer::Base
  default from: "from@example.com"

  def mail_webmaster(email, message)
    @email = email
    @message = message
    mail :to => "guneybilen@yahoo.com", :subject => "Akbay - from: #{email}", :from =>  "admin@isgetir.com"
  end

end
