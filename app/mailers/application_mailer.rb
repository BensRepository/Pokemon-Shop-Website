class ApplicationMailer < ActionMailer::Base
  default to: "bens@gmail.com", from: 'benother@gmail.com'
  layout 'mailer'
end
