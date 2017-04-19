class StaticPagesController < ApplicationController
  def index
    @products = Product.last(4)
  end

  def landing_page
    @products = Product.last(4)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
        :to => 'ovi_tsb@yahoo.com',
        :subject => "A new contact form message from #{@name}",
        :body => @message).deliver_now
  end

end
