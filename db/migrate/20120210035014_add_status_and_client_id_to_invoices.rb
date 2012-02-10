class AddStatusAndClientIdToInvoices < ActiveRecord::Migration
  def up
	add_column :invoices, :client_id, :integer
	add_column :invoices, :status, :string
  end
  
  def down
	remove_column :invoices, :client_id
	remove_column :invoices, :status
  end
end
