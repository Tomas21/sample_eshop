class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_message(user)
    @user = user

    mail to: user.email, subject: 'Dakujeme za registraciu'
  end
end
