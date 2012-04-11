class RenameClientsToContacts < ActiveRecord::Migration
  def up
    rename_table :clients, :contacts
  end

  def down
    rename_table :contacts, :clients
  end
end
