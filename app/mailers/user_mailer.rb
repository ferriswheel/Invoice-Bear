class UserMailer < ActionMailer::Base

  include SendGrid

  default from: "info@invoicebear.com"
  
  def welcome_email(user)
	@user = user
	@url = "http://www.example.com/login"
	mail(:to => user.email, :subject => "Welcome to InvoiceBear!")
  end
  
end
