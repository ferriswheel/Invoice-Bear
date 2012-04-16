class DashboardController < ApplicationController
  def show
    @invoices = Invoice.where(:user_id => current_user.id)
    @outstanding = @invoices.outstanding
  end

end
