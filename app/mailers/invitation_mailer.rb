class InvitationMailer < ActionMailer::Base
  default from: "invitations@remitwise.com"

  def invite_with_remittance(from_user, to_user, remittance)
    @from_user = from_user
    @to_user = to_user
    @remittance = remittance
    mail(:to => @from_user.email, :subject => "#{from_user.email} invited you to RemitWise")
  end
end
