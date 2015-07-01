class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @contact.page_url = params['page']
  end

  def create
    @contact = Contact.new(params[:contact])
    byebug
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

end
