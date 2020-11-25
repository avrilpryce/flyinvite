class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invite.subject
  #

  def invite
    @invitation = params[:invitation]
    @email = @invitation.email
    @greeting = "Hello"

    mail to: @email
  end
end
