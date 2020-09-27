class ConversionsController < ApplicationController
  
  def index
    @conversions = Conversion.all
  end 

  def create
    if Conversion.between(params[:sender_id], params[:recipient_id]).present?
      @conversion = Conversion.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversion = Conversion.create!(conversion_params)
    end
    redirect_to conversion_messages_path(@conversion)
  end

  private

  def conversion_params
    params.permit(:sender_id, :recipient_id)
  end
  
end
