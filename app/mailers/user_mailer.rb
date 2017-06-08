class UserMailer < ApplicationMailer
  include Devise::Mailers::Helpers
  default from: 'ovi_tsb@hotmail.com'
  
  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
         :to => 'ovi_tsb@hotmail.com',
         :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Shop"
    mail( :to => user.email, :subject => "Welcome to #{@appname}!")
          
  end

  def payment_confirmation(user, product)
      @user = user
      @product = product
      mail( :to => user.email,
            :subject => "Payment confirmation")
  end

end
