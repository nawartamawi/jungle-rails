class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order, user)
    @order = order
    @user = user
    mail(to: 'nawartamawi@gmail.com', subject: 'Thanks for Ordering')
  end

end
