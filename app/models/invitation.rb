class Invitation < ActiveRecord::Base
  belongs_to :user
  
  # accepts the invitation, forming a connection between the two people, and deletes the invitation
  def accept
    Connection.new({:sender_id => user.id, :receiver_id => User.find_by_email(recipient_email).id}).save
    destroy
  end
end
