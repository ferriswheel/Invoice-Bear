class InvoiceMailer < ActionMailer::Base
  include SendGrid

  default from: "info@invoicebear.com"
  
  def invoice_notification(invoice)
	@invoice = invoice
	@client = @invoice.client
	mail(:to => client.email, :subject => "New Invoice For You")
  end
end
