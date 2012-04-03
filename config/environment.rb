# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Invoicebear::Application.initialize!

ActionMailer::Base.smtp_settings = {
:user_name => "invoicebear",
:password => "MonfortC1S",
:domain => "invoicebear.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}

