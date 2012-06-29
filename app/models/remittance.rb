class Remittance < ActiveRecord::Base

  belongs_to :user
  belongs_to :recipient, :class_name => "User"

  has_many :intended_uses

  attr_readonly :user_id, :recipient_email

end
