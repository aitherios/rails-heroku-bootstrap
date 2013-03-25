class ContactMailer < ActionMailer::Base
  default to: 'aitherios@gmail.com'

  def contact_mail(hash)
    @name = hash[:name]
    @email = hash[:email]
    @message = hash[:message]

    mail(from: @email, subject: "[#{ENV['APP_HOSTNAME']}] #{@name}")
  end
end
