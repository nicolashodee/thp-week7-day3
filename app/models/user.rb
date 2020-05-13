class User < ApplicationRecord

  ##### MODEL USER ######

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :events, through: :attendances

  # appelle welcome_send ci dessous apres la creation d'un user
  after_create :welcome_send

  def welcome_send
    # on envoie un email avec la methode welcome_email du user_mailer
    UserMailer.welcome_email(self).deliver_now
  end

end
