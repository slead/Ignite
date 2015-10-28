class NotifyMailer < ActionMailer::Base
  default from: "info@IgniteTalks.io"

    def new_draft_email(user, video)
      @user = user
      @video = video
      mail(to: @user.email, subject: 'New video added to IgniteTalks.io')
    end

end
