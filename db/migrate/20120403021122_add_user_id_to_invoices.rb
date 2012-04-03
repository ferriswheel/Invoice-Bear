class AddUserIdToInvoices < ActiveRecord::Migration
  def up
	add_column :invoices, :user_id, :integer
  end
  
  def down
	remove_column :users, :account_id
  end
end
