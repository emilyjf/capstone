# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def poll_email
    UserMailer.poll_email(User.first, Poll.last)
  end
end
