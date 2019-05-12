class ReactionsController < ApplicationController
  before_action :set_user
  def new
    @reaction = Reaction.new
  end

  def create
    reaction = Reaction.create(reaction_params)
  end

  private

  def reaction_params
    params.require(:reaction).permit(:stamp_type, :stamp_number).merge(message_id: params[:message_id], user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
    @message = Message.find(params[:message_id])
    @message_id = @message.id
  end
end
