class CreateRemittances < ActiveRecord::Migration
  def change
    create_table :remittances do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.decimal :amount
      t.string :provider
      t.text :message
      t.datetime :date

      t.timestamps
    end
  end
end
