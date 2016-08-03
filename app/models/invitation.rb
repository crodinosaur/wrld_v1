class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  # before_create :send_out_code


  # def send_out_code
  # 	InvitationMailer.send_to_follower(self)
  # end

end
