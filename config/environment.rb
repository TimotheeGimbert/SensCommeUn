# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings =   {
  :address            => ENV['serveur_mail'],
  :port               => 465,
  :domain             => ENV['serveur_mail'],
  :authentication     => :plain,
  :user_name          => ENV['mail_login'],
  :password           => ENV['mail_pwd'],
  tls:                  true,
  enable_starttls_auto: true,
  :openssl_verify_mode  => 'none'
}