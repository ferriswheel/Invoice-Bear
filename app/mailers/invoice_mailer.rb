class InvoiceMailer < ActionMailer::Base
  include SendGrid

  default from: "info@invoicebear.com"
  
  def invoice_notification(invoice)
	@invoice = invoice
	u = @invoice.user_id
	@user = User.find(u)
	mail(:to => invoice.contact.email, :subject => "New Invoice For You")
  end
  
  def invoice_paid(invoice)
    @invoice = invoice
    mail(:to => "kevin@kevincollignon.com", :subject => "You've been paid!")
  end
end
