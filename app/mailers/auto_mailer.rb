class AutoMailer < ActionMailer::Base
  default from: "info@swapmywhip.com"
  default_url_options[:host] = "swapmywhip.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
	subject: "Welcome to SwapMyWhip.com")
  end
  
  def new_message(message)
    @message = message
    mail(to: @message.recipient.email,
	subject: "New Message at SwapMyWhip.com")
  end
  
  def contact_us_message(message)
    @message = message
    mail(to: "info@swapmywhip.com",
	from: @message.email,
	subject: "Message Sent Using 'Contact Us' Form: " + @message.subject)
  end
  
  def password_reset_instructions(user)
    @user = user
    @edit_password_reset_url = edit_password_reset_url(@user.perishable_token)
    mail(to: @user.email,
	subject: "Password Reset Instructions for your swapmywhip.com account")
  end


end
