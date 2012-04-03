class UserMailer < ActionMailer::Base
  default from: "kevin@kevincollignon.com"
  
  def welcome_email(user)
	@user = user
	@url = "http://www.example.com/login"
	mail(:to => user.email, :subject => "Welcome to InvoiceBear!")
  end
  
end
