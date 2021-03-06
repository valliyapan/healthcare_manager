class UserMailer < ApplicationMailer
  default :from => "healthcaremanagerapp@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email}", :subject => "Registration Confirmation")
  end
end
