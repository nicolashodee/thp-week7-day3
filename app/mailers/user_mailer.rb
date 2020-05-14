class UserMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'

  def welcome_email(user)
    @user = user 
    @url  = 'https://eventbrite-nicolas.herokuapp.com/users/sign_in' 
    mail(to: @user.email, subject: 'Bienvenue chez notre Event Brite facon THP') 
  end

end
