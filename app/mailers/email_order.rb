class EmailOrder < ApplicationMailer
  default from: 'burner_kirat@mail.com'

  def email_user(email)
    @carts = email
    mail(to: 'burner_kirat@mail.com', subject: 'Sample Email')
  end
end
