class ReactionsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @message = Message.find(params[:message_id])
    Reaction.create(reaction_params)
  end

  private

  def reaction_params
    params.require(:reaction).permit(:stamp_type, :stamp_number).merge(message_id: params[:message_id], user_id: current_user.id)
  end
end
