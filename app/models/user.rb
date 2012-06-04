class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :remittances, :order => :date
  has_many :received_remittances, :foreign_key => :recipient_id, :class_name => "Remittance"

  has_many :receivers, :through => :receiver_connections, :class_name => "User"
  has_many :senders, :through => :sender_connections, :class_name => "User"

  has_many :receiver_connections, :class_name => "Connection", :foreign_key => :sender_id
  has_many :sender_connections, :class_name => "Connection", :foreign_key => :receiver_id

  has_many :invitations

  def incoming_invitations
    Invitation.find_all_by_recipient_email email
  end
end
