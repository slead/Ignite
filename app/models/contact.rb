class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :message,   :validate => true
  attribute :page_url
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact Us submitted via IgniteTalks.io",
      :to => "support@ignitetalks.zendesk.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end