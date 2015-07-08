class ContactsController < ApplicationController
  layout 'no_footer', :only => [:new, :edit]
  def new
    @contact = Contact.new
    @contact.page_url = params['page']
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render 'new', layout: 'no_footer'
    end
  end

end
