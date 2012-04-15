class PaymentNotification < ActiveRecord::Base
  belongs_to :invoice
  serialize :params
  after_create :mark_invoice_as_paid
  
  private
  
  def mark_invoice_as_paid
    if status == "Completed"
      invoice.update_attribute(:status, "sent")
    end
  end
end
