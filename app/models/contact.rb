class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  attribute :message,   :validate => true
  attribute :page_url
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact form - IgniteTalks.io",
      :to => "stephen@ignitetalks.io",
      :from => "stephen@ignitetalks.io"
    }
  end
end