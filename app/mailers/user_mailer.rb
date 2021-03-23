class UserMailer < ApplicationMailer
default from: ENV['EMAIL_LOGIN']

  def welcome_email(user)
    @user =user

    mail(to: @user.email,subject: 'Welcome to NotaCine !')

  end
end