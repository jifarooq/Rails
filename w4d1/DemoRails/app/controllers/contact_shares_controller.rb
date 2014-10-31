class ContactSharesController < ApplicationController
  def create
    cs_params = params[:contact_share].permit(:contact_id, :user_id)
    @contact_share = ContactShare.new(cs_params)
    
    if @contact_share.save
      render json: @contact_share
    else
      render json: @contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @contact_share = ContactShare.find(params[:id])
    @contact_share.try(:destroy)
    
    render json: @contact_share
  end
end
