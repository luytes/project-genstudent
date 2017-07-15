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
end
