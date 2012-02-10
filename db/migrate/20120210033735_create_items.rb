class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.decimal :unit_cost
      t.integer :quantity
      t.decimal :discount
      t.integer :invoice_id

      t.timestamps
    end
  end
end
