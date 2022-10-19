class ApplicationMailer < ActionMailer::Base
  default from: 'jedis@test.com'
  layout 'mailer'

  def welcome(resident)
    @user = resident
    mail(to: @user.email, subject: 'Welcome to Jedis Proj')
  end
end
