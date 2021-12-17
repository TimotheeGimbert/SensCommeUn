class ApplicationMailer < ActionMailer::Base
  default from: ENV['serveur']
  layout 'mailer'
end
