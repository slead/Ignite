class NotifyMailer < ActionMailer::Base
  default from: "info@IgniteTalks.io"

    def sample_email(user)
      @user = user
      mail(to: @user.email, subject: 'Sample Email')
    end

end
