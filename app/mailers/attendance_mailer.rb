class AttendanceMailer < ApplicationMailer

    #### ATTENDANCE MAILER ######## 
    # on definit un mailer pour les participations & creations d'evenements
    
    default from: 'accounts@nicolashodee.com'
    layout 'mailer'

    # methode qui envoie un email pour les nouvelles participations
    def new_attendee_email(user, attendee, event)
        @user = user
        @attendee = attendee
        @event = event

        mail(to: @user.email, subject: "New attendee")
      end
end
