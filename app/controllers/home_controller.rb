class HomeController < ApplicationController

  def home
  end


  def contact
  end

  def request_contact #mailer form method
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    ContactMailer.contact_email(email, name, telephone, message).deliver_now
    flash[:notice] = I18n.t('home.request_contact.email_sent')
    redirect_to root_path
  end

end
