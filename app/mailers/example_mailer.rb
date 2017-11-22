class ExampleMailer < ApplicationMailer
default from: "nayinigopi93@example.com"
  def sample_email(user)
    @user = user
    mail(to: "nayinigopi93@gmail.com", subject: 'Sample Email')
  end
end

