class NotifyMailer < ActionMailer::Base
  default from: "info@IgniteTalks.io"

    def new_draft_email(user)
      @user = user
      mail(to: @user.email, subject: 'New draft requires approval')
    end

end