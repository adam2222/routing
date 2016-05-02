class ContactsController < ApplicationController

  # def index
  #   contacts = Contact.all
  #   render json: contacts
  # end

  # def create
  #   @user = Contact.new(user_params)
  #   render json: @user
  # end

  def index
    user = User.find(params[:user_id])
    render json: user.contacts
  end

  def show
    # user = User.find(params[:id])
    contact = Contact.find(params[:id])
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(user_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end

  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  def create
    contact = Contact.new(user_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

  # def updated_params
  #   params.require(:user).permit(:new_name, :new_email)
  # end
  #
  # def search_params
  #   params.permit(:id, :new_name, :new_email)
  # end

end
