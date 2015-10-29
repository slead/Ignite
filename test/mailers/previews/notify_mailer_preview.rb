# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NotifyMailer.new_video_email(User.first)
  end
end
