class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Genstudent')
    # This will render a view in `app/views/user_mailer`!
  end

  def subscribed(order, user)
    @order = order
    @user = user
    mail(to: 'info@genstudent.com', subject: "#{@user.full_name} subscribed to #{@order.service.title}")
  end

  def user_subscription_notice(order, user)
    @order = order
    @user = user
    mail(to: @user.email, subject: "Your subscription for #{@order.service.title}")
  end

  def new_enquire(enquire, user)
    @enquire = enquire
    @user = user
    mail(to: 'info@genstudent.com', subject: "New enquiry from #{@user.full_name} about #{enquire.service.title}")
  end

  def new_task(survey)
    @survey = survey
    mail(to: 'info@genstudent.com', subject: "New Task from #{@survey.email}")
  end
end
