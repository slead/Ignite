# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NotifyMailer.new_draft_email(User.first, Video.first)
  end
end
