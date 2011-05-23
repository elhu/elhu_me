# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ElhuMe::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "YOURDOMAIN",
  :authentication => :plain,
  :user_name => "YOUR SENDGRID USERNAME",
  :password => "YOUR SENDGRID PASSWORD"
}
