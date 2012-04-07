class InvoiceMailer < ActionMailer::Base
  include SendGrid

  default from: "info@invoicebear.com"
  
  def invoice_notification(file,invoice)
	@invoice = invoice
	attachments["#{invoice.id}.pdf"] = file
	mail(:to => invoice.client.email, :subject => "New Invoice For You")
  end
end
