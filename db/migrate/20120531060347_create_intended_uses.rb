class CreateIntendedUses < ActiveRecord::Migration
  def change
    create_table :intended_uses do |t|
      t.string :use
      t.integer :remittance_id
      t.decimal :money_amount

      t.timestamps
    end
  end
end
