# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("Ben@gmail.com","0bi wan", "07889778909", @message = "Hello there")
  end
end
