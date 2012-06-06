class Remittance < ActiveRecord::Base

  belongs_to :user
  belongs_to :recipient, :class_name => :user

  has_many :intended_uses
    
  attr_readonly :recipient_id, :user_id, :recipient_email

end
