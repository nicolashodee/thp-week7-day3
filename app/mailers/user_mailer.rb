class UserMailer < ApplicationMailer

    #### USER MAILER ########
    # on definit un mailer pour les creations de users

    default from: 'accounts@nicolashodee.com'
    layout 'mailer'
 
    # methode qui envoie un email pour les nouveaux users
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
      @url  = 'https://eventbrite-thp-heroku.herokuapp.com/users/sign_in' 
      mail(to: @user.email, subject: 'Bienvenue chez notre Event Brite facon THP') 
    end

end
