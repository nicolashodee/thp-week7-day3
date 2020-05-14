# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Set SMTP config of Gmail
ActionMailer::Base.smtp_settings =   {
  :address            => 'smtp.sendgrid.net',
  :port               => 587,
  :domain             => 'eventbrite-nicolas.herokuapp.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => ENV['SENDGRID_LOGIN'],
  :password           => ENV['SENDGRID_PWD'],
  :enable_starttls_auto => true
}