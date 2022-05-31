# Preview all emails at http://localhost:3000/rails/mailers/user1_mailer
class User1MailerPreview < ActionMailer::Preview
  def welcome_email
    User1Mailer.with(user1: User1.last).welcome_email
  end

  def edit_email
    User1Mailer.with(user1: User1.last).edit_email
  end
end
