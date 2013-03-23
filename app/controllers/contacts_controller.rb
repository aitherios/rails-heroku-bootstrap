class ContactsController < ApplicationController
  def index; end

  def new
    Contact.create! name: params[:name], email: params[:email], message: params[:message]
    ContactMailer.contact_mail(params).deliver
    render json: { status: 'success' }
  end
end
