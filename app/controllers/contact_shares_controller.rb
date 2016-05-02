class ContactSharesController < ApplicationController

  def destroy
    contact_shares = ContactShare.find(params[:id])
    contact_shares.destroy
    render json: contact_shares
  end

  def create
    contact_shares = ContactShare.new(user_params)
    if contact_shares.save
      render json: contact_shares
    else
      render(
        json: contact_shares.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.require(:contact_shares).permit(:name, :email, :user_id)
  end

  # def updated_params
  #   params.require(:user).permit(:new_name, :new_email)
  # end
  #
  # def search_params
  #   params.permit(:id, :new_name, :new_email)
  # end

end
