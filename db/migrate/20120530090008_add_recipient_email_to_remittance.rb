class AddRecipientEmailToRemittance < ActiveRecord::Migration
  def change
    add_column :remittances, :recipient_email, :string
  end
end
