class InvoiceMailer < ActionMailer::Base
  include SendGrid

  default from: "info@invoicebear.com"
  
  def invoice_notification(invoice)
	@invoice = invoice
	mail(:to => invoice.contact.email, :subject => "New Invoice For You")
  end
end
