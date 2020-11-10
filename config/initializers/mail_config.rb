ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: Rails.application.credentials.gmail[:mail_adress],
  password: Rails.application.credentials.gmail[:app_password],
  authentication: 'plain',
  enable_starttls_auto: true
}