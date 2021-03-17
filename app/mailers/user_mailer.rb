class UserMailer < ApplicationMailer
default from: ENV['EMAIL_LOGIN']

  def welcome_email(user)
    @user =user

    mail(to: @user.email,subject: 'Bienvenue chez nous !')

  end
end