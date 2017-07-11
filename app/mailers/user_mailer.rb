class UserMailer < ApplicationMailer
  default from: 'calimeetme@gmail.com'

  def welcome_email(user)
    @user = user
    # @url = 'http://example.com/login'
    mail(to: 'calimeetme@gmail.com', subject: 'Welcome to MeetMe')
  end

  def poll_email(user)
    @user = user
    mail(to: 'calimeetme@gmail.com', subject: "You've Been Invited!")
  end
end
