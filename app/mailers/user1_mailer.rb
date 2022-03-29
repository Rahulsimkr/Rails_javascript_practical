class User1Mailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_email
    @user1 = params[:user1]
    attachments.inline["image.png"] = File.read("app/assets/images/sign.jpg")
    mail(to: @user1.email, subject: "Welcome to my site.")
  end

  def edit_email
    @user1 = params[:user1]
    attachement.inline["image.jpg"] = File.read("app/assets/images/sign.jpg")
    mail(to: @user1.email, subject: "Welcome to my site.") do |format|
      format.html { render layout: "email_email" }
      format.text
    end
  end
end
