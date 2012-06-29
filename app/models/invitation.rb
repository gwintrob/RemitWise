class Invitation < ActiveRecord::Base
  belongs_to :user
  
  # accepts the invitation, forming a connection between the two people, and deletes the invitation
  def accept
    receiver = User.find_by_email(recipient_email)
    
    Connection.new({:sender_id => user.id, :receiver_id => receiver.id}).save

    remittances = Remittance.where(:user_id => user.id, :recipient_email => recipient_email)
    remittances.each do |remittance|
      remittance.recipient_id = receiver.id
      remittance.save
    end
    destroy
  end
end
