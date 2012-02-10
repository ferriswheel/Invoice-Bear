class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :mphone
      t.string :fax
      t.string :email
      t.decimal :balance
      t.string :bname

      t.timestamps
    end
  end
end
