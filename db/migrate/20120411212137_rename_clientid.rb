class RenameClientid < ActiveRecord::Migration
  def up
    rename_column :invoices, :client_id, :contact_id
  end

  def down
  end
end
