class Attendance < ApplicationRecord

    after_create :attendance_send
    belongs_to :user
    belongs_to :event
   
    private 

    def attendance_send
        #pour notifier a un tilisateur sa participation a un event
        #on appelle la methode notif_email_attendee dans le attendance mailer pour envoyer l'email de bievenu a l'event maintenant
	    AttendanceMailer.new_attendee_email(self.event.user, self.user, self.event).deliver_now
	end

end
