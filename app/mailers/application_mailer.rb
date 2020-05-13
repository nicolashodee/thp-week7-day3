class ApplicationMailer < ActionMailer::Base
  default from: 'accounts@nicolashodee.com'
  layout 'mailer'

  def welcome_email(user)
		@user = user
    @url = "http://eventbrite.be/login"
    mail(to: @user.email, subject: "Bienvenue sur Eventbrite made in THP by Nico")
  end

end
