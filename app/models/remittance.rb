class Remittance < ActiveRecord::Base

  belongs_to :user
  belongs_to :recipient, :class_name => :user

end
