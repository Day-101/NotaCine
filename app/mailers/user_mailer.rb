class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email
    
    mail(to: "avion@yopmail.com", subject: 'Bienvenue chez nous !') 
  end
end
