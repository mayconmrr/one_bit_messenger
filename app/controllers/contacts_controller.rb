class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    user = User.find(email: contact_params[:record][:email])

  end

  private

  def contact_params
    params.require(:contact).permit(record: :email)
  end
end
