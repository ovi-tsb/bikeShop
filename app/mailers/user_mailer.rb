class UserMailer < ApplicationMailer
  default from: 'bikeshop@gmail.com'

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
         :to => 'ovi_tsb@hotmail.com',
         :subject => "A new contact form message from #{name}")
  end
end
