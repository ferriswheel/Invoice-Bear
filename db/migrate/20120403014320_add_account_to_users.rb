class AddAccountToUsers < ActiveRecord::Migration
  def up
	add_column :users, :account_id, :integer
  end
end
