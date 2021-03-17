# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['EMAIL_LOGIN'],
  :password => ENV['EMAIL_PWD'],
  :domain => 'notacine.com',
  :address => 'ssl0.ovh.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}