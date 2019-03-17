# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV.fetch('SG_USER'),
  :password => ENV.fetch('SG_PASS'),
  :domain => ENV.fetch('SG_HOST'),
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
