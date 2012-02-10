class RemoveBalanceFromClients < ActiveRecord::Migration
  def up
  remove_column :clients, :balance
  end

  def down
  end
end
