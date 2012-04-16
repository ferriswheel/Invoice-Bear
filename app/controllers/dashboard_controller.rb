class DashboardController < ApplicationController
  def show
    @invoices = Invoice.where(:user_id => current_user.id)
    
  end

end
