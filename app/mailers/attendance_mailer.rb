class AttendanceMailer < ApplicationMailer
  default from: 'webmaster@nicolashodee.com'

  def attendance_email(attendance)
    @attendance = attendance
    @url = 'https://eventbrite-nicolas.herokuapp.com/event/'
    mail(to: @attendance.user.email, subject: "Tu es inscris à l'évènement #{@attendance.event}")
  end
end