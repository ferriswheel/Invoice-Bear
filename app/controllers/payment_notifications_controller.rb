class PaymentNotificationsController < ApplicationController

  protect_from_forgery :except => [:create]

  # POST /payment_notifications
  # POST /payment_notifications.json
  def create
    PaymentNotification.create!(:params => params, :invoice_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end

end
