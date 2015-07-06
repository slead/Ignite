require 'test_helper'

class NotifyMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  def sample_mail_preview
    NotifyMailer.sample_email(User.first)
  end
end
