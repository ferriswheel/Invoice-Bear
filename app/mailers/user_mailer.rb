class UserMailer < ActionMailer::Base

  include SendGrid

  default from: "info@invoicebear.com"
  
  def welcome_email(user)
	@user = user
	@url = "http://www.invoicebear.com/session/new"
	mail(:to => user.email, :subject => "Welcome to InvoiceBear!")
  end
  
  def internal_new_user_email(user)
	@user = user
	mail(:to => "kevin@kevincollignon.com", :subject => "InvoiceBear: New User")
  end
  
end
