class EmailOrder < ApplicationMailer
  default from: 'burner_kirat@mail.com'

  def email_user(email, carts)
    @carts = carts
    p email
    mail(to: 'burner_kirat@mail.com', subject: 'Your Order')
  end
end
