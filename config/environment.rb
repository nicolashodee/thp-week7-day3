# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# parametre le SMTP du mailer de l'application
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['GMAIL_LOGIN'],
  :password => ENV['GMAIL_PWD'],
  :domain => 'gmail.com',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain
}

