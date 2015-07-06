class NotifyMailer < ActionMailer::Base
  default from: "info@IgniteTalks.io"

    def new_draft_email(user, object)
      @user = user
      mail(to: @user.email, subject: 'New draft requires approval')
    end

end
